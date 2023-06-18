#!/usr/bin/env ruby

require "fileutils"
require "rexml/document"

doc = REXML::Document.new(File.read(ARGV[0]))

svg = doc.elements["svg"]
svg.attributes["viewBox"] = "1300 140 320 320"
svg.attributes["height"] = 512
svg.attributes["width"] = 512

puts doc.to_s
