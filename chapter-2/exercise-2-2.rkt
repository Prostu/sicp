#lang planet neil/sicp

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (midpoint-segment x)
  (define (average a b) (/ (+ a b) 2))
  (make-point (average (x-point (start-segment x)) (x-point (end-segment x)))
              (average (y-point (start-segment x)) (y-point (end-segment x)))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define my-segment (make-segment (make-point 2 2) (make-point 4 4)))
(print-point (midpoint-segment my-segment))