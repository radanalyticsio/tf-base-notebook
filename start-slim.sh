#!/bin/bash
# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.


export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"


/bin/bash