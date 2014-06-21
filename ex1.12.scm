;;; Compute elements of Pascal's Triangle by means of a recursive process.

; assumes row and col are integers >= 0, and that col <= row
(define (pascal row col)
  (cond ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))


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
