#!/bin/bash

echo "Starting benchmark on all servers..."
echo

# Function to benchmark one server
bench() {
    lang=$1
    port=$2
    echo "Benchmarking $lang server on port $port:"
    wrk -t8 -c1000 -d10s http://127.0.0.1:$port
    echo
}

bench "C" 8080
bench "C++" 8081
bench "Rust" 8082
bench "Zig" 8083