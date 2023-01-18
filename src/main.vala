

using GLib;
using Gegl;





int main(string[] args)   {
    Gegl.init(ref args);
    
    simple_pipeline_test();
    
    Gegl.exit();
    return 0;
}
