# run the server and collect activity

if [ ! -d "out" ]; then
    mkdir "out"
fi

sar -u -o out/datafile 1 100
cd out

sadf -d datafile > output.csv