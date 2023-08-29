SHELL := /bin/bash

.PHONY: all
all: $(shell echo ./dist/{simplified,pastel{,-icon,-header},{summer,autumn,winter}{,-icon}}.{svg,png,jpg,gif,webp,heic})

.PHONY: clean
clean:
	rm -rf ./dist/*

./dist/pastel.svg: ./src/pastel.svg
	cp $< $@

./dist/pastel-icon.svg: ./src/pastel.svg
	inkscape --export-filename=./dist/pastel-icon.svg --export-id=512x512 ./src/pastel.svg

./dist/pastel-header.svg: ./src/pastel.svg
	inkscape --export-filename=./dist/pastel-header.svg --export-id=3600x1200 ./src/pastel.svg

./dist/simplified.svg: ./src/simplified.svg
	cp $< $@

./dist/summer.svg: ./src/summer.svg
	cp $< $@

./dist/summer-icon.svg: ./src/summer.svg ./bin/icon-crop.rb
	./bin/icon-crop.rb $< > $@

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
