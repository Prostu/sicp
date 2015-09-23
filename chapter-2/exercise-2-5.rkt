#lang planet neil/sicp

(define (pow b e)
  (if (= e 0) 1 (* b (pow b (dec e)))))
(define (extract b n)
  (if (< 0 (remainder n b)) 0 (inc (extract b (/ n b)))))

(define (cons a b)
  (* (pow 2 a) (pow 3 b)))
(define (car z) (extract 2 z))
(define (cdr z) (extract 3 z))

(cons 3 5)
(car (cons 3 5))
(cdr (cons 3 5))
