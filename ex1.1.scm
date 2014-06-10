;;; Installed Scheme via `brew install mit-scheme` on OS X.
;;; Running Scheme interpreter in Emacs via `M-x run-scheme`.
;;; Donny Winston, 2014-06-10

;; MIT/GNU Scheme running under OS X
;; Type `^C' (control-C) followed by `H' to obtain information about interrupts.

;; Copyright (C) 2014 Massachusetts Institute of Technology
;; This is free software; see the source for copying conditions. There is NO
;; warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.

;; Image saved on Friday May 23, 2014 at 5:50:11 PM
;;   Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
;;   Edwin 3.116


;; Exercise 1.1

1 ]=> 10

;Value: 10

1 ]=> (+ 5 3 4)

;Value: 12

1 ]=> (- 9 1)

;Value: 8

1 ]=> (/ 6 2)

;Value: 3

1 ]=> (+ (* 2 4) (- 4 6))

;Value: 6

1 ]=> (define a 3)

;Value: a

1 ]=> (define b (+ a 1))

;Value: b

1 ]=> (+ a b (* a b))

;Value: 19

1 ]=> (= a b)

;Value: #f

1 ]=> (if (and (> b a) (< b (* a b)))
          b
          a)

;Value: 4

1 ]=> (cond ((= a 4) 6)
            ((= b 4) (+ 6 7 a))
            (else 25))

;Value: 16

1 ]=> (+ 2 (if (> b a) b a))

;Value: 6

1 ]=> (* (cond ((> a b) a)
               ((< a b) b)
               (else -1))
         (+ a 1))

;Value: 16

1 ]=> 
