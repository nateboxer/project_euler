(println (java.util.Date.))

(defn is-goal? [v]
	(let [a (nth v 0) b (nth v 1) c (nth v 2)]
		(when (and (= (+ a b c) 1000) (= (* c c) (+ (* a a) (* b b))))
			(println (str "YES! " a " " b " " c)))))

(doall (map is-goal? 
	(for [a (range 1 500) b (range 1 500) c (range 1 500)] [a b c])))

(println (java.util.Date.))
