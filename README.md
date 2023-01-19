# CinkPipeline

Image processing pipeline for "cink" effect (Non-GUI)

"Cink" is short for "Color Ink" which isn't the most brilliant name ever but that's what I call
it.  The effect is to turn a photo into an image that looks like an ink drawing with colors, or
something like a watercolor painting. Depending on settings, the result could look somewhat
like a stained glass window. 

![Original photograph](https://github.com/darenw/CinkPipeline/blob/main/images/NedTrainCafe465-original-smaller.jpg)
![Artified (manually in GIMP)](https://github.com/darenw/CinkPipeline/blob/main/images/NedTrainCafe465-simple-smaller.jpg)

Originally, I did this in GIMP manually. It took typically 50 to 80 or more steps. 
It was hard to go back to an early step, nudge a parameter up a little, then re-do all the 
following steps.  Therefore, cink is a good candidate for scripting, some sort of automation
software.  Ideally, it would be like a spreadsheet. Change a value in one place, and see the 
result way over there update automatically.  A GUI could show the images at any intermediate
point and the final image, with easy sliders, checkboxes and such to adjust parameters.

For R&D purposes, CinkPipeline has just the processing filters and parameters, no GUI, to
help refine the pipeline design. 

As a command line tool, it could be used to batch process quantities of images, or incorporate
into a GUI tool. Finding the best settings won't be easy with no GUI or viewing of intermediate
images.




## Stages

1. Image Prep

Prepare image for the work. Stretch for full range histogram, maybe clip white peaks.
Crop, flip to suit final composition. Upsize, because noise introduce onto oversized macropixels
leads to a more interesting result. 

2. Split & Mix

Input image is RGB. We want to work in CIE La*b*, and may also want HSV available. 
Various combinations of R G B L A B H S V may be formed as the inputs to the following stages.


3. Linework I & II

An edge detector followed by Noise Spread, Oilify and Cubism to create a randomized sketchy look.
The linework step sometimes is worth repeating with different parameters to combine with the 
first to have depth of darkness along major boundaries and lighter brushiness in other places.


4. Colorwork I & II

In LAB space,  quantize A and B.  For artistically messy edges, input to this step should have
Noise Spread, maybe Oilify.  Simplest way to quantize A,B is to Posterize, but a more flexible
way is to define a curved, angled, nonlinear grid of points in AB space.

Repeat with two different quantizations, arrays of points at different angles, to be mixed 
for imitating layers of transparent paint.  


5. Color Snuff 

Similar to Linework but with bigger blockier use of Cubism and Oilify, defining a wider region around
the results of Linework. This is used as a mask to keep color bound within areas, and not touch the 
linework in most places.  Use of randomness, cubism makes it "sloppy" with occasional overlaps. 


6. Compositing

The color snuff layer removes color near the linework. 
The linework is superimposed on the snuffed color.  
Some alpha adjustment for best looks. Save to file.


Along the way are several uses of unsharp to sharpen edges, enhance noise, decorrelate colors, 
and curve adjustments to squash the black end or white end, and


## Usage

Work in progress - no one know how to use this yet. Not even me!


## Python Toolkit

Not meant for just anyone to use, but a sketchy personal toolkit for image processing and artsy effects,
https://github.com/darenw/cinktools  (no useful documentation yet) 
This lacks a Cubism step, and some other things, but could do maybe 80% of the work of making
cink artified works from photos.


## References

GEGL:  main site 

Using GEGL pipelines as general filter in GIMP:
 http://gimpchat.com/viewtopic.php?f=10&t=19463&sid=79cd4e7e103c12ffdc5607609b7d5114 

Using GEGL and gtk4 in simple Vala program: https://github.com/GNOME/gegl-gtk/blob/master/examples/vala/gegl-gtk-basic.vala 

## Example: Pink Flower

This image was created manally in GIMP. 
When this project is far enough along, I'll put CinkPipeline's output here.

![Original photograph](https://github.com/darenw/CinkPipeline/blob/main/images/PinkFlower_Xshow_photo.jpg)
![Artified (manual)](https://github.com/darenw/CinkPipeline/blob/main/images/PinkFlower_Xshow_artified.jpg)





