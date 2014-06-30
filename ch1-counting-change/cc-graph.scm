(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc-graph amount kinds-of-coins)

  (define (display-node label amount kinds-of-coins)
    (display "  ")
    (display label)
    (display " [label=\"")
    (display `(cc ,amount ,kinds-of-coins))
    (display "\"];")
    (newline))

  (define (display-edge a b)
    (display "  ")
    (display a)
    (display " -> ")
    (display b)
    (display ";")
    (newline))

  (define (base-case amount kinds-of-coins)
    (or (< amount 0)
        (= kinds-of-coins 0)
        (= amount 0)))

  (define (left label)
    (string-append label "l"))

  (define (right label)
    (string-append label "r"))

  ; label is the unique label of the function invocation, e.g.  "sllrl" is
  ; reached by traveling (from the root) left then left then right then left.
  (define (recurse label amount kinds-of-coins)
    (cond ((base-case amount kinds-of-coins)
           (display-node label amount kinds-of-coins))
          (else
           (display-node label amount kinds-of-coins)
           (display-edge label (left label))
           (display-edge label (right label))
           (recurse (left label) amount (- kinds-of-coins 1))
           (recurse (right label)
                    (- amount (first-denomination kinds-of-coins))
                    kinds-of-coins))))

  (display "digraph {")
  (newline)
  (recurse "s" amount kinds-of-coins)
  (newline)
  (display "}"))

(cc-graph 100 5)
