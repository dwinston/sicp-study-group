(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (pow base exponent)
  (cond ((= base 0) 0)
        ((= exponent 0) 1)
        (else (* base (pow base (- exponent 1))))))


(pow 2 10)

;Value: 1024

(pow 2 16)

;Value: 65536

(A 1 10)

;Value: 1024

(A 2 4)

;Value: 65536

(A 3 3)

;Value: 65536

(define (f n) (A 0 n))

; 2*n

(define (g n) (A 1 n))

; 2^n

(define (h n) (A 2 n))

; 2^2^2^2...^2, with (- n 1) 2's in total
; 2^n^n
