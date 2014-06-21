(define (inc a) (+ a 1))
(define (dec a) (- a 1))

;; The below procedure generates a recursive process because the process cannot
;; be summarized at every step by a set of state variable values -- there is
;; additional "hidden" information maintained by the interpreter that indicates
;; "where the process is" in negotiating a chain of deferred operations.

(define (plus-recur a b)
  (if (= a 0)
      b
      (inc (plus-recur (dec a) b))))

;; The below procedure generates an iterative process because the state at any
;; stage in the evolution of the process is captured completely by two state
;; variables, a and b.

(define (plus-iter a b)
  (if (= a 0)
      b
      (plus-iter (dec a) (inc b))))
