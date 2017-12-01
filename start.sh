#!/bin/bash
# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.

if [[ "x$JUPYTER_NOTEBOOK_PASSWORD" != "x" ]]; then
    HASH=$(python -c "from notebook.auth import passwd; print(passwd('$JUPYTER_NOTEBOOK_PASSWORD'))")
    echo "c.NotebookApp.password = u'$HASH'" >> /home/$NB_USER/.jupyter/jupyter_notebook_config.py
fi

if [[ -n "$JUPYTER_NOTEBOOK_X_INCLUDE" ]]; then
    curl -O $JUPYTER_NOTEBOOK_X_INCLUDE
fi

export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"
export CUDA_HOME="/usr/local/cuda" 
export CUDA_PATH="${CUDA_HOME}" 
export PATH="${CUDA_HOME}/bin${PATH:+:${PATH}}" 
export LD_LIBRARY_PATH="/usr/local/lib:${CUDA_HOME}/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"; 
echo -e “$CUDA_HOME \\n $CUDA_PATH \\n $LD_LIBRARY_PATH”

exec jupyter notebook