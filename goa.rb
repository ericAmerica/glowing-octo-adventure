#!/usr/bin/env ruby
require 'bundler/inline'

gemfile true do
  source 'https://rubygems.org'
  gem 'exiftool'
  gem 'nokogiri'
  gem 'nori'
end

def get_type_from_exif(image)
  data = Exiftool.new(image)
  data[:file_type]
end

# check if exif data and xml file match on image type
# also catches <physicalDescription><internetMediaType> repeated element. 
def get_status(image_type, xml_media_type)
  image_type.eql?(xml_media_type) ? "PASS" : "FAIL"
end

File.open('adventure.txt', 'w') do |file|
  Dir.glob('xmls/*') do |xml_file|
    xml = Nokogiri::XML(File.open(xml_file))
    xml_values = Nori.new.parse(xml.to_s)

    xml_media_type = xml_values['mods']['physicalDescription']['internetMediaType']
    xml_media_title = xml_values['mods']['title']

    case xml_media_type
    when "JPEG2000"
      ext = ".jp2"
      xml_media_type = "JP2"
    when "TIFF"
      ext = ".tif"
    end

    image_file = "images/#{File.basename(xml_file, ".*")}#{ext}"
    
    # catch exception for missing file/wrong file ext or corrupted exif data
    begin
      image_type = get_type_from_exif(image_file)
      status = get_status(image_type, xml_media_type)
    rescue StandardError => e
      status = "FAIL"
    end
   
    file.puts "#{File.basename(image_file, ".*")}\t #{xml_media_title}\t #{status}"
  end
end