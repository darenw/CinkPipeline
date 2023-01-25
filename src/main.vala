

using GLib;
//using Gegl;


const string pink_flower_photo =
 "./images/PinkFlower_Xshow_photo.jpg";
 



int main(string[] args)   {
    stdout.printf("Enter main()");
    Gegl.init(ref args);
    
    if (args[1]=="--list") {
        string[] oplist = Gegl.list_operations();
        foreach (string op in oplist)  {
            stdout.printf(" - %s\n", op);
        }
        //g_free(oplist);   NO! Only in C. Not needed in Vala.
        return 1;
    }
    
    var flower_process_params = ProcessingParams() {
        hueshift = -73.0f,
        poster_levels = 3,
        blur_r = 2.1f
    };
    
    stdout.printf("About to create pipeline");
    Pipeline pipeline = new Pipeline(flower_process_params);
    stdout.printf("About to process photo");
    pipeline.run(pink_flower_photo, "FUZIII.jpg");
    stdout.printf("DOne");
    
    Gegl.exit();
    return 0;
}
