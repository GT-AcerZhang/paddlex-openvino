# download third-part lib
if [ ! -d "./deps" ]; then
    mkdir deps
fi
if [ ! -d "./deps/gflag" ]; then
    cd deps
    git clone https://github.com/gflags/gflags
    cd gflags
    cmake .
    make -j 8
    cd ..
    cd ..
fi
if [ ! -d "./deps/glog" ]; then
    cd deps
    git clone https://github.com/google/glog
    sudo apt-get install autoconf automake libtool
    cd glog
    ./autogen.sh
    ./configure
    make -j 8
    cd ..
    cd ..
fi
if [$1 == "x86"]
    OPENCV_URL=https://bj.bcebos.com/paddlex/deploy/x86opencv/opencv.tar.bz2
else
    OPENCV_URL=https://bj.bcebos.com/paddlex/deploy/armopencv/opencv.tar.bz2
fi
if [ ! -d "./deps/opencv" ]; then
    cd deps
    wget -c ${OPENCV_URL}
    tar xvfj opencv.tar.bz2
    rm -rf opencv.tar.bz2
    cd ..
fi
