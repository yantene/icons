SHELL := /bin/bash

.PHONY: all
all: $(shell echo ./dist/{winter{,-icon},simplified}.{svg,png,jpg,gif,webp,heic})

.PHONY: clean
clean:
	rm -rf ./dist/*

./dist/winter.svg: ./src/winter.svg
	cp $< $@

./dist/winter-icon.svg: ./src/winter.svg ./bin/icon-crop.rb
	./bin/icon-crop.rb $< > $@

./dist/simplified.svg: ./src/simplified.svg
	cp $< $@

./dist/%.png: ./dist/%.svg
	inkscape --export-type="png" --export-filename="$@" $<

./dist/%.jpg: ./dist/%.png
	convert $< $@

./dist/%.gif: ./dist/%.png
	convert $< $@

./dist/%.webp: ./dist/%.png
	convert $< $@

./dist/%.heic: ./dist/%.png
	convert $< $@
