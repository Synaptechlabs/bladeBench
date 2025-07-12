
// blade_core.cpp - Minimal HTTP server in C++
#include <iostream>
#include <cstring>
#include <netinet/in.h>
#include <unistd.h>

int main() {
    int server_fd = socket(AF_INET, SOCK_STREAM, 0);
    sockaddr_in addr{};
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(8081);

    bind(server_fd, (sockaddr*)&addr, sizeof(addr));
    listen(server_fd, 128);

    const std::string response = "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK";
    char buffer[1024];

    while (true) {
        int client_fd = accept(server_fd, nullptr, nullptr);
        read(client_fd, buffer, sizeof(buffer));
        write(client_fd, response.c_str(), response.size());
        close(client_fd);
    }

    return 0;
}
