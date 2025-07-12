const std = @import("std");

const sockaddr_in = extern struct {
    sin_family: u16,
    sin_port: u16,
    sin_addr: extern struct {
        s_addr: u32,
    },
    sin_zero: [8]u8,
};

fn htons(x: u16) u16{
    return (x<<8) | (x>>8);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const sock_fd = try std.posix.socket(
        std.posix.AF.INET,
        std.posix.SOCK.STREAM,
        0,
    );
    defer std.posix.close(sock_fd);

    try std.posix.setsockopt(sock_fd, std.posix.SOL.SOCKET, std.posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));

    var addr = sockaddr_in{
        .sin_family = std.posix.AF.INET,
        .sin_port = htons(8083),
        .sin_addr = .{ .s_addr = 0 },
        .sin_zero = [_]u8{0} ** 8,
    };

    try std.posix.bind(sock_fd, @ptrCast(&addr), @sizeOf(sockaddr_in));
    try std.posix.listen(sock_fd, 128);

    try stdout.print("Zig 0.12 TCP server listening on 0.0.0.0:8083\n", .{});

    while (true) {
        const client_fd = try std.posix.accept(sock_fd, null, null,0);
        defer std.posix.close(client_fd);

        _ = try std.posix.write(client_fd, "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK");
    }
}

