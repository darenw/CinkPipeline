

using GLib;
//using Gegl;



void list_all_filters()  {
        string[] oplist = Gegl.list_operations();
        foreach (string op in oplist)  {
            stdout.printf(" - %s\n", op);
        }
        //g_free(oplist);   NO! Only in C. Not needed in Vala.
}




void pink_flower_test()  {

    const string pink_flower_photo =
        "./images/PinkFlower_Xshow_photo.jpg";

    const string outfile = "TESTX99.jpg";

    var flower_process_params = LittleTestProcessingParams() {
        hueshift = -73.0f,
        poster_levels = 3,
        blur_r = 2.1f
    };
    
    LittleTestPipeline pipeline = new LittleTestPipeline(flower_process_params);
    pipeline.run(pink_flower_photo, outfile);
}



int main(string[] args)   {
    stdout.printf("Enter main()");
    Gegl.init(ref args);
    
    
    
    if (args[1]=="--list")  {
        list_all_filters();
    } 
    else if (args[1]=="--test")  {
        pink_flower_test();
    }
    
    
    Gegl.exit();
    return 0;
}
