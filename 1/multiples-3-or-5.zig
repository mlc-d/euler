const std = @import("std");

const roof: i32 = 999;

fn eulerSum(n: i32) i32 {
    const x: i32 = @divFloor(roof, n);
    return @divFloor(n * (x * (x + 1)), 2);
}

pub fn main() void {
    std.debug.print("{}\n", .{eulerSum(3) + eulerSum(5) - eulerSum(15)});
}
