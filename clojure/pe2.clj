; sum of all even fib nums less than 4 000 000

(loop [a 1 b 2 sum 0]
   (if (< a 4000000)
    (recur b (+ a b) (+ sum (if (even? a) a 0)))
    (println sum)))


