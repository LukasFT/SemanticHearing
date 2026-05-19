#!/usr/bin/env bash

# Accept conda Terms of Service for non-interactive runs
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

conda create --name semhear python=3.8
conda activate semhear
pip install -r requirements.txt
