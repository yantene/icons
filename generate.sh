#!/bin/sh

SVG_FILE="yantene.svg"

# Generate 512 x 512 icon

ICON_FILE_NAME="icon.png"

ICON_W=512.0
ICON_H=512.0
ICON_X0=1307.988
ICON_Y0=189.988
ICON_X1=1626.442
ICON_Y1=508.442

inkscape $SVG_FILE \
  -a=$ICON_X0:$ICON_Y0:$ICON_X1:$ICON_Y1 \
  -w $ICON_W -h $ICON_H \
  -e=$ICON_FILE_NAME \
  -z

# Generate full image

FULL_FILE_NAME="full.png"

inkscape $SVG_FILE \
  -e=$FULL_FILE_NAME \
  -z
