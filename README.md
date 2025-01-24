zig-fib: A Fibonacci number generator in Zig
============================================

```
Usage: zig-fib <integer>
```

**Note:** This is currently limited to the 93rd Fibonacci number due to only using 64-bit, unsigned integers.


Building
--------

```shell
$ zig build
```


Running
-------

```shell
$ ./zig-out/bin/zig-fib 93
fib(93) = 12200160415121876738
```
