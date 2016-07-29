; largest palindrome from product of two 3-digit numbers

; this is cool, but 
(defn is-palindrome [x]
  (loop [s (str x)]
    (if (<= (count s) 1)
      true
      (if (= (first s) (last s))
        (recur (butlast (rest s)))
        false))))
     
; this is simpler
(defn is-palindrome2 [x]
  (= (seq (str x)) (reverse (seq (str x)))))

(loop [x 999 y 999 biggest 0]
  (if (= x y 100)
    (println biggest)
    (recur (if (= y 100) (dec x) x) 
           (if (= y 100) 999 (dec y))
           (let [product (* x y)]
            (if (and (is-palindrome2 product) (> product biggest)) product biggest)))))
  
