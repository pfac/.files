#!/bin/sh
export PATH=.:~/bin:/usr/local/bin:$PATH
export LSCOLORS=Dxfxdxcxbxxxxxxxxxxxxx

# add the home lib folder to the default search path
LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH

#	CUDA
#export PATH=$PATH:/usr/local/cuda/bin
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/cuda/lib

