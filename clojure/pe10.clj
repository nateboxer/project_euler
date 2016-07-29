(defn is-prime? [n]
	(let [lim (Math/sqrt n)]
		(loop [x 2]
			(if (> x lim)
				true
				(if (= (mod n x) 0)
					false
					(recur (inc x)))))))

(loop [x 2 sum 0]
  (if (is-prime? x)
    (if (< x 2000000)
      (recur (inc x) (+ sum x))
      (println (str "sum: " sum)))
    (recur (inc x) sum)))

