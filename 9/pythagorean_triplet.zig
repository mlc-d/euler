const std = @import("std");

pub fn main() !void {
    // no need to code it; pythagorean triplets can be
    // made with the following generalization:
    // a = k(m^2 - n^2)
    // b = 2kmn
    // c = k(m^2 + n^2)
    // And since a + b + c == 1000, then:
    // 1000 = 2km(m + n)
    // 1000 / 2 = km(m + n)
    // 500 = km(m + n)
    // After finding the prime factorization of 500, we get:
    // 2^2*5^3
    // n = 1; m = 4; k = 25
    // a = 25 * (16 - 1) = 375
    // b = 2 * 25 * 4 * 1 = 200
    // c = 25 * (16 + 1) = 425
}
