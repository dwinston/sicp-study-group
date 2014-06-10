;; Exercise 1.5

;; normal-order evaluation: "fully expand and then reduce"
;; applicative-order evaluation: "evaluate the arguments and then apply"
;; Lisp uses applicative-order evaluation, but normal-order can be useful
;; e.g. for stream processing (to be introduced in Ch 3).

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; With applicative-order evaluation, the evaluation will never return a value
;; because `(p)` will never return. With normal-order evaluation, because the
;; arguments to `test` are not evaluated prior to evaluating the body of `test`,
;; and because `y` is never evaluated (because `(= x 0)` evaluates to true),
;; `(test 0 (p))` will return 0.
