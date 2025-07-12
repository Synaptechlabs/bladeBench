# 🗡️ bladebench
**bladebench** is a micro-benchmarking project to compare low-level network dispatch performance across four languages: **C**, **C++**, **Rust**, and **Zig**.

🚀 Designed to explore **minimalist, ultra-fast API routing cores** for future systems where performance, determinism, and elegance matter more than bloat and boilerplate.

## 🔧 What It Does
Each implementation is a raw TCP server that:
- Listens on a port
- Accepts connections
- Sends back a static HTTP response

Then benchmarked with [`wrk`](https://github.com/wg/wrk) at 1000 connections.

## 🏁 Results (10s @ 1000 connections)
| Language | Requests/sec | Transfer/sec | Notes |
|----------|--------------|--------------|-------|
| **Zig**  | **80,700**   | 3.08 MB/s     | ⚡ Fastest raw speed, but I/O errors due to buffer overrun |
| **Rust** | 49,388       | 1.88 MB/s     | 🧠 Most stable high-perf with fewer socket errors |
| **C++**  | 40,715       | 1.55 MB/s     | 🛠️ Balanced performance |
| **C**    | 32,976       | 1.26 MB/s     | 🧼 Clean, simplest |

See [performance_summary.md](performance_summary.md) for detailed logs.

## 📦 Structure
```
bladebench/
├── blade_core.c
├── blade_core.cpp
├── blade_core.rs
├── blade_core.zig
├── bench.sh
├── Makefile
└── performance_summary.md
```

## 📋 Requirements
- `gcc`, `g++`, `rustc`, `zig` (0.12.0+)
- `wrk` for benchmarking

Install `wrk`:
```bash
sudo apt install wrk
```

## 🧪 Run Benchmarks
```bash
make
# Start each binary in its own terminal:
./blade_c      # Port 8080
./blade_cpp    # Port 8081
./blade_rs     # Port 8082
./blade_zig    # Port 8083

# Then run benchmark
./bench.sh
```

## 💡 Why?
Because modern backend routing is often bloated and slow. This repo explores how far you can go with just the bare metal — clean, fast, and under your control.

## 📜 License
MIT
