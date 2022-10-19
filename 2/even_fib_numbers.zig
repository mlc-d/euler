const std = @import("std");

const limit: i32 = 4000000;

fn fib() i32 {
    var a: i32 = 0;
    var b: i32 = 1;
    var aux: i32 = 0;
    var result: i32 = 0;
    while (b < limit) {
        aux = b;
        b += a;
        a = aux;
        if (@mod(b, 2) == 0) {
            result += b;
        }
    }
    return result;
}

pub fn main() !void {
    std.debug.print("{}\n", .{fib()});
}
