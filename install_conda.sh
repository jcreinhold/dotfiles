#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
    curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
else
    echo "Operating system must be either OS X or linux"
fi

chmod 755 Miniconda3*.sh

./Miniconda3*.sh -b

rm Miniconda3*.sh

conda update --all --yes
