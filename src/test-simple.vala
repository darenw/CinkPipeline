// test-simple.vala
// Simple try-out of GEGL pipelining. 
// Messes with flower image, writes to file.

using GLib;
using Gegl;



 
public
struct ProcessingParams  {
    float hueshift;     // degrees, from -180.0 to +180.0
    int poster_levels;  
    float blur_r;
}



public class Pipeline : Object {
    
    Gegl.Node pipe;
    Gegl.Node loader;
    Gegl.Node saver;
    
    public Pipeline(ProcessingParams params)  {
        pipe = new Gegl.Node();
        
        loader = pipe.create_child("gegl:load");
        
        var huespin = pipe.new_child("operation", "gegl:hue-chroma",
             "hue",  params.hueshift,
             null);
             
        var poster = pipe.new_child("operation", "gegl:posterize", 
            "levels", params.poster_levels,
            null);
            
        var blur = pipe.new_child("operation", "gegl:gaussian-blur", 
            "std-dev-x", params.blur_r,
            "std-dev-y", params.blur_r,
            null);
            
        saver=pipe.new_child("operation", "gegl:save", 
            "quality",  20,
            null);
        
        /*    
        var ok1=loader.connect_to("output", poster, "input");
        var ok2=poster.connect_to("output", blur, "input");
        var ok3=blur.connect_to("output", saver, "input");
        stdout.printf(@"connect ok ($ok1) ($ok2) ($ok3)\n");
        */
        pipe.link_many(loader, huespin, poster, blur, saver, null);        
    }
    
    public void run(string infile, string outfile)  {
        stdout.printf(@"processing file $infile, writint to $outfile\n");
        loader.set_property("path", infile);
        saver.set_property("path", outfile);

        graph_dump_outputs(saver);
        saver.process();
    }
}


