;;; Compute elements of Pascal's Triangle by means of a recursive process.

; assumes row and col are integers >= 0, and that col <= row
(define (pascal row col)
  (cond ((> col row) (display "bad input"))
        ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(define (pascal-triangle row)
  (define (pt-helper row from-col)
    (cond ((= from-col row) '(1))
          (else
           (cons (pascal row from-col)
                 (pt-helper
                  row
                  (+ 1 from-col))))))
  (pt-helper row 0))

(define (pascal-triangle-until row)
  (define (ptu-helper row)
    (cond ((< row 0) '())
          (else
           (cons
            (pascal-triangle row)
            (ptu-helper (- row 1))))))
  (reverse (ptu-helper row)))

(define (display-pt pt-list)
  (cond ((null? pt-list) (newline))
        (else
         (display (indent (length pt-list)))
         (pp-list (car pt-list))
         (display-pt (cdr pt-list)))))

(define (pp-list lst)
  (cond ((null? lst) (newline))
        (else
         (display
          (string-append
           (indent
            (floor
             (/ (- 3
                   (string-length
                    (string (car lst))))
                2)))
           (string (car lst))
           (indent
            (floor
             (/ (- 4
                   (string-length
                    (string (car lst))))
                2)))))
         (pp-list (cdr lst)))))

(define (indent n)
  (cond ((= n 0) "")
        (else
         (string-append " " (indent (- n 1))))))

(display-pt (pascal-triangle-until 8))

1 ]=> (pascal 0 0)

;Value: 1

1 ]=> (pascal 1 0)

;Value: 1

1 ]=> (pascal 1 1)

;Value: 1

1 ]=> (pascal 2 0)

;Value: 1

1 ]=> (pascal 2 1)

;Value: 2

1 ]=> (pascal 2 2)

;Value: 1

1 ]=> (pascal 3 0)

;Value: 1

1 ]=> (pascal 3 1)

;Value: 3

1 ]=> (pascal 3 2)

;Value: 3

1 ]=> (pascal 3 3)

;Value: 1

1 ]=> (pascal 4 0)

;Value: 1

1 ]=> (pascal 4 1)

;Value: 4

1 ]=> (pascal 4 2)

;Value: 6

1 ]=> (pascal 4 3)

;Value: 4

1 ]=> (pascal 4 4)

;Value: 1
