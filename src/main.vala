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


struct AllPipelineParams {
    CleanParams clean;
    SplitParams split;
    int useless;
}



void fill_params_for_pink_flower(out AllPipelineParams all)   {
    all.clean.placeholder = 0.1f;
    all.split.placeholder = 0.2f;
    all.useless = 9;
}


void list_all_filters()  {
        string[] oplist = Gegl.list_operations();
        foreach (string op in oplist)  {
            stdout.printf(" - %s\n", op);
        }
        //g_free(oplist);   NO! Only in C. Not needed in Vala.
}




int main(string[] args)   {

    Gegl.init(ref args);
    
    
    if (args[1]=="--list-gegl")  {
        list_all_filters();
        Gegl.exit();
        return 0;
    } 
    
    
    AllPipelineParams pipeline_params;
    fill_params_for_pink_flower(out pipeline_params);
    
    
    Gegl.exit();
    return pipeline_params.useless;
}
