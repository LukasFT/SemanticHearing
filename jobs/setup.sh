#!/usr/bin/env bash

# Accept conda Terms of Service for non-interactive runs
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# ensure conda tos already accepted before this
if [ -d "env" ]; then
  echo "Dir env exists, skipping setup"
else
  conda clean --packages --tarballs --index-cache -y
  conda create -y --prefix ./env python=3.8
fi

source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate ./env
pip install -r requirements.txt
