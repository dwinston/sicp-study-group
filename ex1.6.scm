(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                         x)))

;; An evaluation of `new-sqrt-iter` will never return because the Scheme
;; interpreter uses applicative-order evaluation. The evaluation of `new-if`
;; will try to evaluate all its arguments before evaluating its
;; body. Unfortunately, this means that `new-sqrt-iter` will get called again
;; (and again and again...) regardless of whether or not the guess is
;; good-enough?.

