#!/usr/bin/env ruby

require 'rubygems'
require 'chunky_png'

image = ChunkyPNG::Image.from_file('/tmp/banner.png')

image.save('/tmp/banner_new.png')

exit