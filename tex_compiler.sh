#!/bin/bash

BASE="${1%.*}"
if [ -f "$BASE.tex" ]
then
	echo "Archivo $BASE.tex existente. \n\t Compilando ...\n\n"
else
	echo "\n\n\tRevise nombre del archivo. \n\n"
	exit 1
fi

pdflatex $BASE.tex
if [ $? -ne 0 ]; then
    echo "\n\n\tError de compilacion. Ver $BASE.log\n\n"
    exit 1
fi
bibtex $BASE
echo "\n PDFlatex \n"
pdflatex $BASE.tex > mainout.out
echo "\n BibTex \n"
pdflatex $BASE.tex > mainout.out

rm mainout.out
rm $BASE.log

echo "\n PDF \n"
evince $BASE.pdf

echo "\n Echo \n"
exit 0