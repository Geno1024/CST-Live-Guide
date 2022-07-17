#!/bin/bash

[[ -n $BUILD_COUNT_SERVER ]] && curl -so build.txt "$BUILD_COUNT_SERVER"/CST-Live-Guide4 || echo -n "LOCAL" > build.txt

rm -rf build
chapters=$(find ./* -maxdepth 1 -type d)
mkdir build
for chapter in $chapters; do
  mkdir build/"$chapter"
done
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
biber --output-directory=build CST-Live-Guide
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
cp build/CST-Live-Guide.pdf CST-Live-Guide.pdf
