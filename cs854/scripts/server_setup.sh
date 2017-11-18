function gen_file(){
    head -c $1 /dev/urandom > "dummy_$1.txt"
}

function gen_files(){
    for i in {100..1000..100}
    do
        gen_file $i
    done
    
    for i in {2000..10000..1000}
    do
        gen_file $i
    done
    
    for i in {20000..100000..10000}
    do
        gen_file $i
    done
    
    for i in {200000..1000000..100000}
    do
        gen_file $i
    done
}

function install_openssl(){
    cd openssl-1.1.0g/;
    ./config -Wl,--enable-new-dtags,-rpath,'$(LIBRPATH)' --prefix=/usr/local/ssl;
    sudo make;
    sudo make install;
    cd ..;
}

function install_nghttp2(){
    cd nghttp2/;
    git submodule update --init;
    autoreconf -i;
    automake;
    autoconf;
    ./configure --enable-apps;
    make;
    sudo make install;
    sudo ldconfig;
}

function install_nginx(){
    
}

function install_webservers(){
    
}

#main script
cwd=$(pwd)

if [ ! -d "/www" ]; then
    mkdir "/www"
fi

cd "/www"
gen_files
cd $cwd
