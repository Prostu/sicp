#lang planet neil/sicp

(define (reverse list)
  (define (reverse-int l1 l2)
    (if (null? l1) l2 (reverse-int (cdr l1) (cons (car l1) l2))))
  (reverse-int list nil))

(define (same-parity x . my-list)
  (define (parity x) (remainder x 2))
  (define (build-same result i-list)
    (if (null? i-list)
        result
        (let ((e (car i-list)))
          (if (= (parity e) (parity x))
              (build-same (cons e result) (cdr i-list))
              (build-same result (cdr i-list))))))
  (reverse (build-same (cons x nil) my-list)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
