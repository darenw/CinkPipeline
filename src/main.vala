

using GLib;
using Gegl;




int main(string[] args)   {
    Gegl.init(ref args);
    
    if (args[1]=="--list") {
        string[] oplist = Gegl.list_operations();
        foreach (string op in oplist)  {
            stdout.printf(" - %s\n", op);
        }
        //g_free(oplist);   NO! Only in C. Not needed in Vala.
        return 1;
    }
    
    simple_pipeline_test();
    
    Gegl.exit();
    return 0;
}
