// Just brute force it
const std = @import("std");

fn findPrimes(a: u64) !void {
    const n: usize = 1000;
    var primes = [_]u64{0} ** n;
    primes[0] = 2;
    primes[1] = 3;
    var flag: bool = true;
    var candidate: u64 = 5;
    var index: usize = 2;
    while (primes[n - 1] == 0) {
        flag = true;
        for (primes) |value| {
            if (value == 0) {
                break;
            }
            // NOTE: is there any other (and more efficient) way to cast
            // these types? or to get the integer part of a square root?
            var x = @floatToInt(u64, @sqrt(@intToFloat(f64, candidate))) + 1;
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
    var i: usize = n;
    while (i >= 0) {
        if (@mod(a, primes[i - 1]) == 0) {
            std.debug.print("Largest prime factor is: {}\n", .{primes[i - 1]});
            break;
        }
        i -= 1;
    }
}

pub fn main() !void {
    try findPrimes(600851475143);
}
