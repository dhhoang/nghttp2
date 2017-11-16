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


#main script
cwd=$(pwd)

if [ ! -d "/www" ]; then
    mkdir "/www"
fi

cd "/www"
gen_files
cd $cwd
