#!/bin/bash

[[ -n $BUILD_COUNT_SERVER ]] && curl -so build.txt "$BUILD_COUNT_SERVER"/CST-Live-Guide4 || echo -n "LOCAL" > build.txt
rm -rf build
mkdir build
xelatex -output-directory=build -shell-escape CST-Live-Guide.tex
xelatex -output-directory=build -shell-escape CST-Live-Guide.tex
cp build/CST-Live-Guide.pdf CST-Live-Guide.pdf
