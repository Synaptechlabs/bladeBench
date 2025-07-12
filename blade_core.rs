
// blade_core.rs - Minimal HTTP server in Rust
use std::io::{Read, Write};
use std::net::{TcpListener};

fn main() {
    let listener = TcpListener::bind("127.0.0.1:8082").unwrap();
    for stream in listener.incoming() {
        let mut stream = stream.unwrap();
        let mut buffer = [0; 1024];
        stream.read(&mut buffer).unwrap();
        let response = b"HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK";
        stream.write_all(response).unwrap();
    }
}
