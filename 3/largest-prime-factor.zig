const std = @import("std");

fn findPrimes() !void {
    const n: usize = 25000;
    var primes = [_]u64{0} ** n;
    primes[0] = 2;
    primes[1] = 3;
    var flag: bool = true;
    var candidate: u64 = 5;
    var index: usize = 2;
    while (primes[n - 1] == 0) {
        flag = true;
        for (primes) |value| {
            var x = @floatToInt(u64, @sqrt(@intToFloat(f64, candidate))) + 1;
            if (value == 0) {
                break;
            }
            if (@mod(candidate, value) == 0 and value <= x) {
                flag = false;
                break;
            }
        }
        if (flag) {
            primes[index] = candidate;
            index += 1;
        }
        candidate += 2;
    }
    for (primes) |number| {
        std.debug.print("{}\n", .{number});
    }
}

pub fn main() !void {
    try findPrimes();
}
