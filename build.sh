#!/bin/bash

# Build script for Sam Blundell's website
# Compiles Tailwind CSS and prepares files for deployment

echo "Building website..."

# Compile Tailwind CSS
echo "Compiling Tailwind CSS..."
./tailwindcss-linux-x64 -i src/css/input.css -o src/css/main.css --minify

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✓ CSS compiled successfully"
else
    echo "✗ CSS compilation failed"
    exit 1
fi

echo "Build complete! Files ready for deployment."