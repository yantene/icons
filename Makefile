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
	convert $< $@

./dist/%.jpg: ./dist/%.svg
	convert $< $@

./dist/%.gif: ./dist/%.svg
	convert $< $@

./dist/%.webp: ./dist/%.svg
	convert $< $@

./dist/%.heic: ./dist/%.svg
	convert $< $@
