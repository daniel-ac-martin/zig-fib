const std = @import("std");
const testing = std.testing;

fn fib_sub(n: u64) [2]u64 {
    switch (n) {
        0 => return .{ 0, 0 },
        1 => return .{ 1, 0 },
        2 => return .{ 1, 1 },
        else => {
            const p = fib_sub(n - 1);
            return .{ p[0] + p[1], p[0] };
        },
    }
}

pub export fn fib(n: u64) callconv(.C) u64 {
    return fib_sub(n)[0];
}

test "fibonacci" {
    try testing.expect(fib(0) == 0);
    try testing.expect(fib(1) == 1);
    try testing.expect(fib(2) == 1);
    try testing.expect(fib(3) == 2);
    try testing.expect(fib(4) == 3);
    try testing.expect(fib(5) == 5);
    try testing.expect(fib(10) == 55);
    try testing.expect(fib(15) == 610);
}
