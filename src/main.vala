// MAIN for CinkPipeline24
// 
//
// STAGE ONE (July 2024) - hardcode pipeline here, no modularizing, 
//     but keep each step's params in separate source file as prep for next stage.
//
// STAGE TWO:  Pull out GEGL nodes for each step, modularize as composite node, 
//     put into separate sources.
//
// See source and short description at https://github.com/darenw/CinkPipeline
// (C) 2024 Daren Scot Wilson 

using GLib;
//using Gegl;




void list_all_filters()  {
        string[] oplist = Gegl.list_operations();
        foreach (string op in oplist)  {
            stdout.printf(" - %s\n", op);
        }
        //g_free(oplist);   NO! Only in C. Not needed in Vala.
}




const string pink_flower_photo = "./images/PinkFlower_Xshow_photo.jpg";

const string outfilename = "TEST.jpg";

void fill_params_for_pink_flower(out AllPipelineParams all)   {
    all.clean.placeholder = 0.1f;
    all.split.placeholder = 0.2f;
    all.useless = 9;
}


int main(string[] args)   {

    Gegl.init(ref args);
    
    
    if (args[1]=="--list-gegl")  {
        list_all_filters();
        Gegl.exit();
        return 0;
    } 
    
    
    PipelineArchitecture architecture;   
    fill_standard_pipeline_architecture(out architecture);
    
    AllPipelineParams pipeline_params;
    fill_params_for_pink_flower(out pipeline_params);
    
    ArtifyPipeline pipeline = new ArtifyPipeline();
    pipeline.build(ref architecture);
    pipeline.set_params(ref pipeline_params);
    pipeline.process_image_file(pink_flower_photo, outfilename);
    
    
    Gegl.exit();
    return pipeline_params.useless;
}
