;; recursive process
(define (f n)
  (cond ((< n 3) n)
        (else
         (+
          (f (- n 1))
          (* 2 (f (- n 2)))
          (* 3 (f (- n 3)))))))
(define f-recur f)

;; iterative process
;; uses an accumulator `accu` to know when done
(define (f n)
  (define (f-iter n fn-1 fn-2 fn-3 accu)
    (cond ((< n 3) n)
          ((= accu n)
           (+ fn-1 (* 2 fn-2) (* 3 fn-3)))
          (else
           (f-iter n
                   (+ fn-1 (* 2 fn-2) (* 3 fn-3))
                   fn-1
                   fn-2
                   (+ 1 accu)))))
  (f-iter n 2 1 0 3))
(define f-iter f)

(define (check-f-up-to n)
  (cond ((< n 3) (= (f-recur n) (f-iter n)))
        (else
         (and (= (f-recur n) (f-iter n))
              (check-f-up-to (- n 1))))))

(check-f-up-to 100)

;Value: #t

