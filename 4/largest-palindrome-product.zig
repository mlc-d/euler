const std = @import("std");

fn isPalindrome(n: u64) bool {
    var a: u64 = n;
    var b: u64 = 0;
    var c: u64 = a;
    while (a > 0) {
        b = b * 10 + @mod(a, 10);
        a /= 10;
    }
    return c == b;
}

fn findPalindrome(a: u64, b: u64) void {
    var c: u64 = a;
    var d: u64 = b;
    var largest: u64 = 0;
    while (c > 500) {
        d = b;
        while (d > 500) {
            var candidate: u64 = c * d;
            if (isPalindrome(candidate)) {
                if (candidate > largest) {
                    largest = candidate;
                }
            }
            d -= 1;
        }
        c -= 1;
    }
    std.debug.print("Largest palindrome is: {}.\n", .{largest});
}

pub fn main() !void {
    findPalindrome(999, 999);
}
