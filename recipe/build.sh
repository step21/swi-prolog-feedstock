#!/bin/bash

#to fix problems with zlib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:${PREFIX}/include
ls ${PREFIX}/include
echo "---------------------"
ls ${BUILD_PREFIX}/include
echo "-------"
ls ${BUILD_PREFIX}/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:${PREFIX}/include
export LIBRARY_PATH=$LIBRARY_PATH:${PREFIX}/lib
ls ${PREFIX}/lib 
echo "-------------------------"
export LD_LIBRARY_PATH="${PREFIX}/lib"

export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"


#./prepare --yes
#./configure --prefix=$PREFIX
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" -SCMAKE_BUILD_TYPE=Release ..
#cmake --prefix=$PREFIX $BUILD_PREFIX
make VERBOSE=1 -j${CPU_COUNT}
make install -j${CPU_COUNT}
#curdir=${PWD}
#for package in packages/*; do
#    echo "Package: $package"
#    cd $curdir/$package && ./configure --prefix=$PREFIX && make && (make install || true)
#done

