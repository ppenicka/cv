#!/bin/bash

# Define variables
OUTPUT_DIR="./docs"
INPUT_FILE="cv-penicka.tex"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found!"
  exit 1
fi

# Create the output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
  echo "Creating output directory: $OUTPUT_DIR"
  mkdir -p "$OUTPUT_DIR"
fi

# Run pdflatex with the specified output directory
echo "Compiling $INPUT_FILE..."
pdflatex -output-directory="$OUTPUT_DIR" "$INPUT_FILE"

# Check if the PDF was successfully created
PDF_FILE="$OUTPUT_DIR/$(basename "$INPUT_FILE" .tex).pdf"
if [ -f "$PDF_FILE" ]; then
  echo "Compilation successful! PDF output located at: $PDF_FILE"
else
  echo "Error: PDF compilation failed!"
  exit 1
fi
