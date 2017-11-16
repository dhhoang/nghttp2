sudo apt-get update
sudo apt-get install g++ make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev libc-ares-dev libjemalloc-dev libsystemd-dev libspdylay-dev cython python3-dev python-setuptools
echo "entering dir nghttp2/"
cd ../../

function build_nghttp2(){
    git submodule update --init
    autoreconf -i && automake && autoconf
    ./configure --enable-app
    make
}

build_nghttp2
