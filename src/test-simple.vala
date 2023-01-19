// test-simple.vala


using GLib;
using Gegl;


const string pink_flower_photo =
 "./images/PinkFlower_Xshow_photo.jpg";
 
 

public class Pipeline : Object {
    
    Gegl.Node pipe;
    Gegl.Node loader;
    Gegl.Node saver;
    
    public Pipeline()  {
        pipe = new Gegl.Node();
        
        loader = pipe.create_child("gegl:load");
        
        var poster = pipe.new_child("operation", "gegl:posterize", 
            "levels", 7,
            null);
            
        var blur = pipe.new_child("operation", "gegl:gaussian-blur", 
            "std-dev-x", 3.3,
            "std-dev-y", 3.3,
            null);
            
        saver=pipe.new_child("operation", "gegl:save", 
            "path", "FUZPOSTER.jpg", 
            "quality",  20,
            null);
        
        /*    
        var ok1=loader.connect_to("output", poster, "input");
        var ok2=poster.connect_to("output", blur, "input");
        var ok3=blur.connect_to("output", saver, "input");
        stdout.printf(@"connect ok ($ok1) ($ok2) ($ok3)\n");
        */
        pipe.link_many(loader, poster, blur, saver, null);        
    }
    
    public void run(string fname)  {
        stdout.printf(@"processing file ($fname)\n");
        loader.set_property("path", fname);
        graph_dump_outputs(saver);
        saver.process();
    }
}



int simple_pipeline_test() {
    
    Pipeline pipeline = new Pipeline();
    pipeline.run(pink_flower_photo);
    
    
    return 5;
}
