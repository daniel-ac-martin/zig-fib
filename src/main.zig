const std = @import("std");
const lib = @import("./root.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = std.process.argsAlloc(allocator) catch |err| {
        std.debug.print("Failed to allocate arguments\n", .{});
        return err;
    };
    defer std.process.argsFree(allocator, args);

    if (args.len != 2) {
        std.debug.print("Usage: {s} <integer>\n", .{args[0]});
        std.process.exit(1);
        return;
    }

    const input = args[1];
    const n = std.fmt.parseInt(u64, input, 10) catch |err| {
        std.debug.print("Failed to parse integer: {s}\n", .{input});
        return err;
    };

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("fib({d}) = ", .{n});
    try bw.flush();

    const r = lib.fib(n);

    try stdout.print("{d}\n", .{r});
    try bw.flush();
}
