# 📊 bladebench Performance Summary

Benchmark conducted using `wrk` with:
- 8 threads
- 1000 concurrent connections
- 10 seconds per test

## ✅ Results
| Language | Requests/sec | Transfer/sec | Socket Errors |
|----------|--------------|--------------|----------------------------|
| **Zig**  | 80,700       | 3.08 MB/s    | 701k write errors (buffer overrun) |
| **Rust** | 49,388       | 1.88 MB/s    | ~0 |
| **C++**  | 40,715       | 1.55 MB/s    | 0 |
| **C**    | 32,976       | 1.26 MB/s    | 0 |

## 🧠 Analysis
- **Zig** shows the best raw speed — but without write buffers, errors spike under pressure.
- **Rust** balances performance and safety well.
- **C++** performs solidly with no timeouts or errors.
- **C** is cleanest but least performant under concurrency.

## 🛠️ Recommendations
- For raw dispatch engines: Zig (if tuned), C++
- For real-world production: Rust with async
- Use C as a fallback baseline

## 🔍 Next Steps
- Implement hot-swappable routing
- Add JSON-aware parsing core
- Evaluate with gRPC and WebSockets
