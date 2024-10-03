mds = $(wildcard _src/*.md)
htmls = $(patsubst _src/%.md,%.html,$(mds))
css_src = $(wildcard _src/*.css)
css_target = $(patsubst _src/%.css,res/%.css,$(css_src))

all: $(htmls)
clean:
	rm -rf res *.html

$(css_target): res/%.css: _src/%.css
	mkdir -p res
	cp _src/$*.css res/$*.css

res/katex:
	mkdir -p res
	_utils/load_katex res/katex

$(htmls): %.html: _src/%.md _src/html.template $(css_target) res/katex
	pandoc -t html --katex="res/katex/" \
	  --css "res/fonts.css" \
	  --css "res/index.css" \
	  --template _src/html.template \
	  --standalone -o $*.html \
	  -f gfm _src/$*.md
