;; Exercise 1.3

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-squares-of-two-largest a b c)
  (cond ((and (> a c) (> b c)) (sum-of-squares a b))
        ((and (> a b) (> c b)) (sum-of-squares a c))
        (else (sum-of-squares b c))))

(= (sum-squares-of-two-largest 3 4 5)
   (sum-of-squares 4 5))

(= (sum-squares-of-two-largest 5 4 3)
   (sum-of-squares 4 5))

(= (sum-squares-of-two-largest 3 5 4)
   (sum-of-squares 4 5))
