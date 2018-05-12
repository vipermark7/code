(filter even? (range 0 10))  ; ⇒ (0 2 4 6 8)
(require '[clojure.string/ :as split])
(str/split "hello there" #" ")

(defn cel-to-fahr
  [celsius]
  (double (+ (* celsius  (/ 9 5)) 32)))

(defn add100
  [num]
  (+ num 100))

;; trey hunter's lists challenge from python morsels, except in clojure

(defn simplerange
  [i] ;a list;
  (- (reduce max i) (reduce min i)))
