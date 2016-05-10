<img src="https://github.com/utkdigitalinitiatives/glowing-octo-adventure/blob/master/logo.jpg" width="250">
#### Exercise

You have a folder with the following images and XML pairs:

Folders: 
```
images/
  000.tif
  001.tif
  002.tif
  003.tif
  004.tif
  ...

xmls/
  000.xml
  001.xml
  002.xml
  003.xml
  004.xml
  ...
```
Each image's **EXIF** data should indicate whether or not it is a TIFF or JPEG2000.

Each XML file should have one `<physicalDescription><internetMediaType>` field.  The element is not repeatable.  

#### Results
Discuss how you would create sustainable output to a text file named __'adventure.txt'__ with each row having 3 columns as follows:

```text
IMAGE XML PASS
IMAGE XML PASS
IMAGE XML FAIL
...
```
