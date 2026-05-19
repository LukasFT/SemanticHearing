#!/usr/bin/env bash

# Accept conda Terms of Service for non-interactive runs
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# ensure conda tos already accepted before this
if conda env list | grep -q "env"; then
  echo "Environment 'semhear' exists, skipping creation"
else
  conda update -n base -c defaults conda -y
  conda install -n base -c defaults setuptools --force-reinstall -y
  conda create -y --prefix ./env python=3.8
fi

source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate ./env
pip install -r requirements.txt
