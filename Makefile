.DEFAULT_GOAL = dist

REVISION := $(shell git describe --always --dirty)

.PHONY: clean
clean:
	$(RM) -r dist/*

.PHONY: dist
dist: dist/index.html dist/static/main.css

dist/%.html: src/%.md pandoc/templates/default.html5
	pandoc --data-dir pandoc --from markdown --output $@ --standalone --to html --variable=revision=$(REVISION) $<

dist/static/main.css: src/static/main.css pandoc/templates/default.html5
	./bin/tailwindcss --input src/static/main.css --minify --output dist/static/main.css

.PHONY: setup
setup:
	./bin/setup

.PHONY: serve
serve:
	python3 -m http.server --directory dist 8000
