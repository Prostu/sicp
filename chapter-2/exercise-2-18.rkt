#lang planet neil/sicp

(define (reverse list)
  (define (reverse-int l1 l2)
    (if (null? l1) l2 (reverse-int (cdr l1) (cons (car l1) l2))))
  (reverse-int list nil))

(reverse (list 1 4 9 16 25))