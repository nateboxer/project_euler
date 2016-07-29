(def divisors (range 2 21))

(defn no-remainder [num div]
	(= (rem num div) 0))

(defn divides-by-all? [num]
	(loop [num num divs divisors]
		(if (empty? divs)
			true
				(if (no-remainder num (first divs))
					(recur num (rest divs))
					false))))
			
(loop [num 11]
	(if (divides-by-all? num)
		(println num)
		(recur (inc num))))
