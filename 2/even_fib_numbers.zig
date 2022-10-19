const std = @import("std");

const limit: i32 = 4000000;

fn fib() i32 {
    var a: i32 = 0;
    var b: i32 = 1;
    var c: i32 = 0;
    var result: i32 = 0;
    while (b < limit) {
        c = b + a;
        a = b;
        b = c;
        if (@mod(c, 2) == 0) {
            result += c;
        }
    }
    return result;
}

pub fn main() !void {
    std.debug.print("{}\n", .{fib()});
}
