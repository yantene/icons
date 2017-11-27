#!/usr/bin/env ruby

require 'fileutils'
require 'rexml/document'

SVG_FILE = './yantene.svg'

DIST_DIR = './output'

# Delete and make dist directory

FileUtils.rmtree DIST_DIR
FileUtils.mkdir_p DIST_DIR

# Generate full SVG

FileUtils.cp(SVG_FILE, File.join(DIST_DIR, 'full.svg'))

# Generate icon SVG

doc = REXML::Document.new(File.read(SVG_FILE))

## cropping
svg = doc.elements['svg']
svg.attributes['viewBox'] = '1300 140 320 320'
svg.attributes['height'] = 512
svg.attributes['width'] = 512

File.write(File.join(DIST_DIR, 'icon.svg'), doc.to_s)

# Generate PNG

`convert #{File.join(DIST_DIR, 'full.svg')} #{File.join(DIST_DIR, 'full.png')}`
`convert #{File.join(DIST_DIR, 'icon.svg')} #{File.join(DIST_DIR, 'icon.png')}`

# Generate JPEG

`convert #{File.join(DIST_DIR, 'full.svg')} #{File.join(DIST_DIR, 'full.jpg')}`
`convert #{File.join(DIST_DIR, 'icon.svg')} #{File.join(DIST_DIR, 'icon.jpg')}`

# Generate GIF

`convert #{File.join(DIST_DIR, 'full.svg')} #{File.join(DIST_DIR, 'full.gif')}`
`convert #{File.join(DIST_DIR, 'icon.svg')} #{File.join(DIST_DIR, 'icon.gif')}`
