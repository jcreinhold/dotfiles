#!/bin/bash
conda install anaconda-clean --yes # install the package anaconda clean
anaconda-clean --yes               # clean all anaconda related files and directories
rm -rf ~/anaconda3                 # removes the entire anaconda directory
rm -rf ~/miniconda3                # removes the entire miniconda directory
rm -rf ~/.anaconda_backup           # anaconda clean creates a back_up of files/dirs, remove it
                                    # (conda list; cmd shouldn't respond after the clean up)
