; largest prime factor of 600851475143

(def big-num 600851475143)

(defn is-prime? [n] 
  (loop [x 2 lim (Math/sqrt n)]
    (if (>= x lim)
      true
      (if (= (mod n x) 0)
        false
        (recur (inc x) lim)))))

(defn find-primes [lim]
  (loop [n 3 lim lim primes []]
    (if (<= n lim)
      (recur (+ n 2) lim
        (if (is-prime? n)
          (conj primes n)
          primes))
      primes)))

(def test-primes (find-primes (Math/sqrt big-num)))

(loop [x (- (count test-primes) 1)]
  (if (= (mod big-num (nth test-primes x)) 0)
    (println (nth test-primes x))
    (recur (dec x))))

