#lang planet neil/sicp

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
(cdr (cons 1 2))

; cons returns a function that takes a function as a parameter
; car calls the function passed as an argument with a function that takes
; two parameters and returns the first of them
; cdr calls the function passed as an argument with a function that takes
; two parameters and returns the second of them

(car (cons 5 6))
(car (lambda (m) (m 5 6)))
((lambda (m) (m 5 6)) (lambda (p q) p))
((lambda (p q) p) 5 6)
5