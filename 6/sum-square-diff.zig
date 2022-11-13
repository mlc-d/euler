const std = @import("std");

const limit: u64 = 100;

fn sum() u64 {
    return limit * (limit + 1) / 2;
}

fn sqSum() u64 {
    return (2 * limit + 1) * (limit + 1) * limit / 6;
}

pub fn main() !void {
    std.debug.print("{}\n", .{sum()});
    std.debug.print("{}\n", .{sqSum()});
    std.debug.print("{}\n", .{sum() * sum() - sqSum()});
}

// this solution was made after the website explanation;
// my original solution was made in Python:
// r = range(101)
// x = 0
// for n in r:
//     a += n * n
// print((5050 * 5050) - x)
