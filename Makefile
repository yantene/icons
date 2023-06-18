SHELL := /bin/bash

.PHONY: all
all: $(shell echo ./dist/{simplified,{autumn,winter}{,-icon}}.{svg,png,jpg,gif,webp,heic})

.PHONY: clean
clean:
	rm -rf ./dist/*

./dist/simplified.svg: ./src/simplified.svg
	cp $< $@

./dist/autumn.svg: ./src/autumn.svg
	cp $< $@

./dist/autumn-icon.svg: ./src/autumn.svg ./bin/icon-crop.rb
	./bin/icon-crop.rb $< > $@

./dist/winter.svg: ./src/winter.svg
	cp $< $@

./dist/winter-icon.svg: ./src/winter.svg ./bin/icon-crop.rb
	./bin/icon-crop.rb $< > $@

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
