#!/bin/sh
export PATH=./:~/bin:$PATH
export LSCOLORS=Dxfxdxcxbxxxxxxxxxxxxx

#	CUDA
export PATH=$PATH:/usr/local/cuda/bin
if [ "$DYLD_LIBRARY_PATH" ];
then
	export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/cuda/lib;
else
	export DYLD_LIBRARY_PATH=/usr/local/cuda/lib;
fi;
if [ "$LD_LIBRARY_PATH" ];
then
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib;
else
	export LD_LIBRARY_PATH=/usr/local/lib;
fi;
