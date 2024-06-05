#!/bin/bash

if [ -d "./output" ]; then
    echo "Deleting previous trained model..."
    rm -rf ./output
fi

echo "Parsing YML file in order to generate a new tuning file "

ansible-content-parser --profile min ./role/task/ ./output/