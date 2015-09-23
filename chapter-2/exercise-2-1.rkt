#lang planet neil/sicp

(define (make-rat n d)
  (if (> d 0)
      (let ((g (gcd n d)))
        (cons (/ n g) (/ d g)))
      (make-rat (- n) (- d))))
(define numer car)
(define denom cdr)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -2 -8))
(print-rat (make-rat -2 8))
(print-rat (make-rat 2 -8))
(print-rat (make-rat 2 8))
