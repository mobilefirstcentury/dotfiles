Occasionally, I need to resize an image. For instance, Google+ refuses to use my favorite portrait as my profile picture. The reason is that the portrait is smaller than the minimum requirement of 250 x 250 pixels.

To scale the image, I can opt for a GUI tool such as GIMP or Pinta. This post explores the scaling of pictures using command-line tools.

We will use tools such as convert and identify from the ImageMagick package. To install ImageMagick on Debian:


$ sudo apt-get update
$ sudo apt-get install imagemagick
identify

To know the current dimension of the image, run the identify command:


$ identify portrait1.jpg 
portrait1.jpg JPEG 320x237 320x237+0+0 8-bit DirectClass 20.5KB 0.000u 0:00.000
The result includes the image width and height in the number of pixels (320x237). From that, we know that the image's height is below the minimum requirement.

convert

To scale the height dimension to 250 pixels:


$ convert -resize  x250 -strip portrait1.jpg  myProfile.jpg
$ identify myProfile.jpg
myProfile.jpg JPEG 338x250 338x250+0+0 8-bit DirectClass 35.2KB 0.000u 0:00.000
Note that the width is scaled up proportionally (to 338 pixels). To manually scale the width using convert, specify -resize 338x on the command line.


$ convert -resize 338x -strip portrait1.jpg  myProfile1.jpg
$ identify myProfile1.jpg
myProfile1.jpg JPEG 338x250 338x250+0+0 8-bit DirectClass 35.2KB 0.000u 0:00.000
You can also use convert to dress up the picture, for instance, add a 3-pixel gray frame.


$ convert -resize x250 -strip -frame 3x3  -mattecolor "#999999" portrait1.jpg  framedProfile.jpg


If optimizing file size is a major concern, you should investigate the use of the -quality option.

In general, image quality and file compression have an inverse relationship: higher image quality means lower file compression. The quality value ranges from 1 (lowest quality and highest compression) to 100 (highest quality but lowest compression).


$ convert -resize x250 -quality 95 -strip portrait1.jpg  myProfile95.jpg
$ $ ls -al myProfile*.jpg
-rw-r--r-- 1 peter peter 19267 May 31 16:11 myProfile95.jpg
-rw-r--r-- 1 peter peter 35160 May 31 15:31 myProfile.jpg
Specifying a quality of 95 (as compared to the default) resulted in a 45% reduction of the output file size. Some experimentation with quality values is needed to achieve the balance of minimal file size and acceptable image quality.
