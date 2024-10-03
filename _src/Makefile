all: index.html definitions.html

index.html: index.md html.template
	pandoc -t html --filter pandoc-katex \
	  --css katex.min.css \
	  --css fonts.css \
	  --template html.template \
	  --standalone -o index.html \
	  -f gfm index.md
