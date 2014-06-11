(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))


1 ]=> (/ (sqrt (square 0.001)) 0.001)

;Value: 31.260655525445276


;; For a number comparable to or smaller than the hard-coded tolerance, the sqrt
;; procedure "converges" to a value that is way off. For example, the reported
;; sqrt of 0.001 -- equal to the tolerance -- is off by over 30× (see above).


1 ]=> (/ (sqrt (square 1.7977e+100)) 1.7977e+100)

;Value: 1.

1 ]=> (/ (sqrt (square 1.7977e+200)) 1.7977e+200)
  C-c C-c
;Quit!


;; For a number much larger than the hard-coded tolerance, and with a small
;; enough tolerance such as 0.001, sqrt will never arrive at a good-enough guess
;; due to the limits on precision in the IEEE standard for floating-point
;; arithmetic (IEEE 754). As shown above, whereas `1.7977e+100` is small enough
;; that a number less than 0.001 (1e-3) from it can be represented, this is not
;; the case for `1.7977e+200`. (I got the "1.7977" part from looking up the
;; highest representable number for double-precision floating-point, which is
;; `1.7977e+308` according to
;; [[http://www.mathworks.com/help/matlab/ref/realmax.html]], at least in
;; MATLAB. Scheme barfed at that number, so I tried successively decreasing the
;; exponent by large steps).


(define (good-enough? guess x)
  (< (abs (- 1 (/ (improve guess x) guess))) 0.001))


1 ]=> (/ (sqrt (square 0.001)) 0.001)

;Value: 1.0005538710539446

1 ]=> (/ (sqrt (square 1.7977e+200)) 1.7977e+200)
  C-c C-c
;Quit!


;; The above works better for small numbers, but it still doesn't work for the
;; large number. I'm stuck.
