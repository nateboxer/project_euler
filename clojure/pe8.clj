
(def big-number 
	(apply str (filter (fn [c] (and (not= c \return) (not= c \newline))) 
			(slurp "1000.txt"))))

(def lim (- (count big-number) 5))

(println (java.util.Date.))

(loop [index 0 product 0]
	(if (= index lim)
		(println product)
		(let [new-product (reduce * (map read-string (map str (subs big-number index (+ index 5)))))]
			(recur (inc index) (max new-product product)))))

(println (java.util.Date.))
			
