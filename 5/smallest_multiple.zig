const std = @import("std");

pub fn main() !void {
    // 19 es el número primo más grande menor que 20, por lo que es
    // una buena referencia para probar candidatos.
    var b: u64 = 20;
    const numbers = [_]u64{ 11, 12, 13, 14, 15, 16, 17, 18 };
    var flag: bool = false;
    while (!flag) {
        var x = 19 * b;
        flag = true;
        for (numbers) |n| {
            if (@mod(x, n) != 0) {
                flag = false;
                break;
            }
        }
        if (flag) {
            std.debug.print("19 x {} = {}\n", .{ b, x });
        }
        b += 2; // como 19 multiplicado por un número impar siempre da impar, sólo debemos revisar sus múltiplos pares.
    }
}
