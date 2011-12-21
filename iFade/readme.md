iFade
=====

jQuery Plugin
-------------
iFade is an image fade jQUery plugin that focuses on fading a grayscale image into color.
Since the plugin is very new, there are bugs. To see the bug list, look under the bugs section.

Changelog
---------
iFade 0.1 - Plugin created<br>
iFade 0.2 - Firefox and IE fix

Initialization Instructions
---------------------------
To initialize iFade, add the image you want with the second image that will come in behind the initial image using the HTML img tag with background attribute:

&lt;img src="name_of_image" background="image_for_bg" width="width" height="height" id="myifadepic"&gt;

Then start a jQuery block and use the id or class you gave the image and initialize iFade:

$("img#myifadepic").iFade();

Bugs
----
Second image not found in Chrome and Safari - webkit issue

Source
------
Open source and licensed under CC Public License
Fork the project and help out with bug fixes - All forks welcome!

Contributors
------------
Pazuzu156 - Creator