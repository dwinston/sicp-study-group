;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; If b > 0, return `(+ a b)`.
;; Otherwise, return `(- a b)`.
;; Thus, return `(+ a (abs b))`,
;; where `(abs b)` is the absolute value of b.
