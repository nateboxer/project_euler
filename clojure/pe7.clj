(defn is-prime? [n]
	(let [lim (Math/sqrt n)]
		(loop [x 2]
			(if (> x lim)
				true
				(if (= (mod n x) 0)
					false
					(recur (inc x)))))))

(defn next-prime [n]
	(let [new-n (inc n)]
		(if (is-prime? new-n)
			new-n	
			(next-prime new-n))))

(println (last (take 10001 (iterate next-prime 2))))
