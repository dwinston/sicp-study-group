(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point
   (average (x-point (start-segment s))
            (x-point (end-segment s)))
   (average (y-point (start-segment s))
            (y-point (end-segment s)))))

(define (average x y)
  (/ (+ x y) 2))

(print-point
 (midpoint-segment
  (make-segment (make-point 1 1)
                (make-point 10 20))))
