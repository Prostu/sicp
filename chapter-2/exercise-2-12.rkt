#lang planet neil/sicp

(define (make-interval a b) (cons a b))
(define (upper-bound z) (cdr z))
(define (lower-bound z) (car z))
(define (width z) (/ (- (upper-bound z) (lower-bound z)) 2))
(define (center z) (/ (+ (upper-bound z) (lower-bound z)) 2))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (make-center-percent c p)
  (let ((w (/ (* c p) 100)))
    (make-center-width c w)))

(make-center-percent 6.8 10)
(make-center-percent 4.7 5)
