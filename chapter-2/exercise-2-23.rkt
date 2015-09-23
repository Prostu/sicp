#lang planet neil/sicp

(define (f x) (display x) (newline))
(define my-list (list 57 321 88))

(for-each f my-list)

(define (my-for-each f l)
  (map f l)
  true)

(my-for-each f my-list)

(define (my-second-for-each f l)
  (if (null? l)
      true
      (let ((x (f (car l))))
        (my-second-for-each f (cdr l)))))

(my-second-for-each f my-list)