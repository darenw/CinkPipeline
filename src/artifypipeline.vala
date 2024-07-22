// Pipeline for main "Maripinator" or "Artify" process
// Contains all the image processing logic, parameters, etc.
// is basically the "main" for the actual work but pulled out from
// the main.vala so high level file-reading and execution concerns 
// can be kept there, and the image processing is here.
//
// (C) 2024 Daren Scot Wilson 


using GLib;

const string DEFAULT_OUTFILE_NAME = "outputxxx.jpg";

public
struct PipelineArchitecture {
    int n_colorworks;
}


public
struct AllPipelineParams {
    CleanParams   clean;
    PrepParams    prep;
    SplitParams   split;
    LineworkParams  lineworks;
    ColorworkParams colorworks;
    SnuffParams    snuff;
    CompositingParams compos;
    int useless;
}



public
void fill_standard_pipeline_architecture(out PipelineArchitecture pa)  {
    //pa.n_colorworks = 1;
}



public
class ArtifyPipeline : Object   {
    
    Gegl.Node  pipe;
    Gegl.Node  loader;
    Gegl.Node  saver;
    
    PipelineArchitecture architecture;   
    
    
    public
    ArtifyPipeline()  {
        pipe=null;
    }
    
    
    public
    void build(ref PipelineArchitecture pa)  {
        architecture = pa;  
        
        
        pipe = new Gegl.Node();
        
        loader = pipe.create_child("gegl:load");
        
        var blur = pipe.new_child("operation", "gegl:gaussian-blur",
                "std-dev-x", 4.5f,
                "std-dev-y", 4.5f,
                null);
                
        saver = pipe.new_child("operation",  "gegl:save",
                "path", DEFAULT_OUTFILE_NAME,
                "quality",  20,
                null);
                
                
        pipe.link_many(loader, blur, saver, null);
    }
    
    
    
    
    public
    void set_params(ref AllPipelineParams pipeline_params)   {
        return; 
    }
    

    public
    void process_image_file(string input_fname, string output_fname)   {
        
        loader.set_property("path", input_fname);
        saver.set_property("path",  output_fname);
        
        // Requesting last node to process() triggers all nodes to work
        saver.process();
    }
}


