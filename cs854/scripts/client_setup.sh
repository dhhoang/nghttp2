sudo apt-get update
apt-get install g++ make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev libc-ares-dev libjemalloc-dev cython python3-dev python-setuptools -qy;
echo "entering dir nghttp2/";
cd ../../;

function build_nghttp2(){
    autoreconf -i;
    automake;
    autoconf;
    ./configure --enable-apps;
    make;
}

build_nghttp2;
