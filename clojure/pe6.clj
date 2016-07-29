(defmacro square
	[num]
	`(* ~num ~num))

; take x integers and track the sum of the squares and the sum
(defn grab-sums [lim]
	(loop [num 1 sums-2 0 sums-all 0]
		(if (> num lim)
			(println 
				(str "sum-2=" sums-2 " sums-all=" (square sums-all) " dif=" (- (square sums-all) sums-2)))
			(recur (inc num) (+ sums-2 (square num)) (+ sums-all num)))))
			
(grab-sums 100)
