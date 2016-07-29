(def sum 0)

(defn test? [i] (or (= (rem i 3) 0) 
					(= (rem i 5) 0)))
 
(dotimes [i 1000]
	(if (test? i) (def sum (+ sum i))))

(println (str "Sum = " sum))
 
