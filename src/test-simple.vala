// test-simple.vala


using GLib;
using Gegl;


const string pink_flower_photo_file =
 "../images//home/darenw/CinkArt/tools/CinkPipeline/images/PinkFlower_Xshow_photo.jpg";
 
 

public class Pipeline : Object {
    public Pipeline()  {
    }
    
    public void run(string fname)  {
        stdout.printf(@"pretend processing file ($fname)\n");
    }
}



int simple_pipeline_test() {
    
    Pipeline pipeline = new Pipeline();
    pipeline.run(pink_flower_photo_file);
    
    
    return 5;
}
