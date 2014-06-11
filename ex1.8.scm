(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- 1 (/ (improve guess x) guess))) 0.001))

(define (cube-root x)
  (cube-root-iter 1.0 x))


;; Testing

(define (cube x) (* x x x))


1 ]=> (/ (cube-root (cube 1000)) 1000)

;Value: 1.0000162369748964

1 ]=> (/ (cube-root (cube 0.001)) 0.001)

;Value: 1.0009910142828737

1 ]=> (/ (cube-root (cube 2.5478e100)) 2.5478e100)

;Value: 1.000140905149938
