const std = @import("std");
const allocator = std.mem.Allocator;

fn primeFactory() u64 {
    // zig's comptime constrains make it difficult to work with
    // dynamic size slices; thus, for simplicity's sake I'm
    // hard coding the n value, since the exercise is not ambiguous.
    const n: usize = 10001;
    var primes = [_]u64{0} ** n;

    // use the first two prime numbers as seed to generate the rest
    primes[0] = 2;
    primes[1] = 3;

    // variables used in the while loop.
    var flag: bool = false;
    var candidate: u64 = 5; // just to start with another prime.
    var index: usize = 2;
    var x: u64 = undefined;

    while (primes[n - 1] == 0) { // in other words, as soon as we find the nth prime.
        flag = true;
        for (primes) |prime| {
            if (prime == 0) { // we stop checking when we've already tried all the previous known numbers.
                break;
            }
            // as previously seen in exercise 3, this type casting is a bit boilerplate, but it just works (tm).
            // cast candidate to float -> then square root it -> then cast the result back to u64.
            x = @floatToInt(u64, @sqrt(@intToFloat(f64, candidate))) + 1;
            if (@mod(candidate, prime) == 0 and prime <= x) {
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

    return primes[n - 1]; // nth
}

pub fn main() !void {
    std.debug.print("{}\n", .{primeFactory()});
}

// my original solution was made in C++, because it is a bit more
// flexible when we don't need much memory safety.
// #include <cmath>
// #include <iostream>

// void findPrimes(size_t n) {
//     long long primes[n];
//     for (size_t i = 0; i < n; ++i) {
//         primes[i] = 0;
//     }
//     primes[0] = 2;
//     primes[1] = 3;
//     auto l = sizeof(primes);
//     std::cout << "lenght of array: " << l << std::endl;
//     bool flag;
//     int candidate;
//     size_t index;
//     candidate = 5;
//     index = 2;
//     while (primes[n - 1] == 0) {
//         flag = true;
//         auto x = (int) std::sqrt(candidate);
//         for (int i = 0; i < n || i < x + 1; ++i) {
//             if (primes[i] == 0) {
//                 break;
//             }
//             if (candidate % primes[i] == 0) {
//                 flag = false;
//                 break;
//             }
//         }
//         if (flag) {
//             primes[index] = candidate;
//             index++;
//         }
//         candidate += 2;
//     }
//     std::cout << primes[n - 1] << std::endl;
// }

// int main() {
//     findPrimes(10001);
//     return 0;
// }
