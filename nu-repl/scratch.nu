# This is just a file to type stuff in and then send to the nu-repl in our
# keyboard activated automator action.

(+ 2 2)

(set x 1)

(function test-output ()
    (set x (+ x 1))
    (+ "hey hey hey" x))


"wakka wakka wakka"


# A very slow fibbonaci function... Don't try with values too high
(function fib (n)
    (if (or (eq n 0) (eq n 1))
        1
        (else
            (+ (fib (- n 1)) (fib (- n 2))))))

(fib 11)