
// blade_core.c - Minimal HTTP server in C
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>

int main() {
    int server_fd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in address = {0};
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(8080);

    bind(server_fd, (struct sockaddr*)&address, sizeof(address));
    listen(server_fd, 128);

    char buffer[1024];
    const char* response = "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK";

    while (1) {
        int client_fd = accept(server_fd, NULL, NULL);
        read(client_fd, buffer, sizeof(buffer) - 1);
        write(client_fd, response, strlen(response));
        close(client_fd);
    }

    return 0;
}
