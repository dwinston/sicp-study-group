(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (define (sine-with-count angle count)
    (cond ((not (> (abs angle) 0.1))
           (display count)
           angle)
          (else
           (p (sine-with-count (/ angle 3.0) (+ 1 count))))))
  (sine-with-count angle 0))


;; Check that (sine pi) is approximately 0 and (sine (/ pi 2)) is approximately
;; 1.

(define pi 3.14159)

1 ]=> (sine pi)
4
;Value: -7.85519012433511e-4

1 ]=> (sine (/ pi 2))
3
;Value: .9999996073961978


;; The procedure p is evaluated 5 times when (sine 12.15) is evaluated

1 ]=> (sine 12.15)
5
;Value: -.39980345741334


;; The process is logarithmically recursive in space and time. Because each
;; recursive step reduces the angle by a factor of three, and because there is
;; only one recursive call -- no tree, a tripling of the problem size (the angle
;; argument) increases the number of steps by one and the amount of (unitless)
;; space needed by one. Thus, growth in resource requirements is logarithmic.

1 ]=> (sine 1)
3
;Value: .8415945650055845

1 ]=> (sine 3)
4
;Value: .14044054819729057

1 ]=> (sine 9)
5
;Value: .41024170125489806

1 ]=> (sine 27)
6
;Value: .9545532565129102

1 ]=> (sine 81)
7
;Value: -.6153887225427268

