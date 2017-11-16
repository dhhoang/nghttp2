# This bash scripts generate loads and run it on the test server

target_endpoint="https://aqua99.syn.uwaterloo.ca/"

num_cores=$(grep -c ^processor /proc/cpuinfo)
duration=10
warmup_time=2
stream_per_client=6 #pipelining depth for http/1

urls=(
    $(printf "%sdummy_100.txt" $target_endpoint)
    $(printf "%sdummy_1000.txt" $target_endpoint)
    $(printf "%sdummy_10000.txt" $target_endpoint)
)

echo "Starting benchmark using $num_cores threads"

../../src/h2load --threads=$num_cores --clients=$num_cores --max-concurrent-streams=$stream_per_client --duration=$duration --warm-up-time=$warmup_time "${urls[@]}"
