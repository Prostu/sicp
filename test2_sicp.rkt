#lang planet neil/sicp


(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))