
#### Requirements and usage
This script makes use of bundler's new 'inline' feature which requires a bundler version higher than 1.10 (to update just run gem install bundler ) you can use its new 'inline' feature as described <a href="https://github.com/bundler/bundler/blob/master/lib/bundler/inline.rb">here</a> Bundler will install the required gems and require them for us.

You will also need exiftool installed on your system:

**MacOS with homebrew** 

```text
brew install exiftool
```
**Debian or Ubuntu** 

```text
sudo apt-get install libimage-exiftool-perl
```

To run the script:

```text
ruby goa.rb
```

#### Assumptions

A "FAIL" status is a result of the following:

* The file type returned from the photo's EXIF data does not correlate with the media type found in the corresponding XML file.
* The file extension of the photo does not match the media type found in the XML file.
* The photo file specified by the XML file does not exist.
* the internetMediaType in the XML file has a repeated element. 