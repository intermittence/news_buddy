#!/bin/zsh
# build type
# build_t="-DCMAKE_BUILD_TYPE:STRING=Debug"
# select generator name and path
cmake_generator="-GNinja"
cmake_generator_p="-DCMAKE_MAKE_PROGRAM:FILEPATH=/usr/local/bin/ninja"
# pass cmake cache variables
openssl="-DOPENSSL_ROOT_DIR:PATH=/usr/local/opt/openssl"
# check sh script src and build arguments
# generate
if [ "$#" -eq "2" ]; then
	src_dir=$1
	build_dir=$2
	cmake $build_t $cmake_generator $cmake_generator_p $openssl -S $src_dir -B $build_dir
else
	echo "two arguments (src and build dir) required"
fi