(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (accu-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))

(define (accu-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (accu-length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
