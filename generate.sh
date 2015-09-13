#!/bin/sh

SVG_FILE="yantene.svg"

# Make and clean dist directory

mkdir -p output
rm -rf output/*

# Generate plain SVG

SVG_FILE_NAME="output/yantene.svg"

inkscape $SVG_FILE \
  -l=$SVG_FILE_NAME \
  -z

# Generate 512 x 512 icon

ICON_W=512.0
ICON_H=512.0
ICON_X0=1307.988
ICON_Y0=189.988
ICON_X1=1626.442
ICON_Y1=508.442

ICON_FILE_NAME="output/icon.png"

inkscape $SVG_FILE \
  -a=$ICON_X0:$ICON_Y0:$ICON_X1:$ICON_Y1 \
  -w $ICON_W -h $ICON_H \
  -e=$ICON_FILE_NAME \
  -z

# Generate full image

FULL_FILE_NAME="output/full.png"

inkscape $SVG_FILE \
  -e=$FULL_FILE_NAME \
  -z
