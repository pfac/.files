#!/bin/sh
export PATH=.:~/bin:/usr/local/bin:$PATH
export LSCOLORS=Dxfxdxcxbxxxxxxxxxxxxx

# LIBRARY DIRECTORIES
# 	~/lib:	so I can install stuff in my home
# 	/usr/local/cuda/lib:	for CUDA stuff
LIBS="${HOME}/lib:/usr/local/cuda/lib";

#	CUDA
export PATH=$PATH:/usr/local/cuda/bin
if [ "$DYLD_LIBRARY_PATH" ];
then
	export DYLD_LIBRARY_PATH="${LIBS}:${DYLD_LIBRARY_PATH}";
else
	export DYLD_LIBRARY_PATH="${LIBS}";
fi;
if [ "$LD_LIBRARY_PATH" ];
then
	export LD_LIBRARY_PATH="${LIBS}:${LD_LIBRARY_PATH}";;
else
	export LD_LIBRARY_PATH="${LIBS}";
fi;
