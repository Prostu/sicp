#lang planet neil/sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (define (iter ibit pb result)
    (define grow (square pb))
    (cond ((= ibit 0) result)
          ((even? ibit) (iter (/ ibit 2) grow result))
          (else (iter (/ (dec ibit) 2) grow (* pb result)))))
  (iter n b 1))

(fast-expt 2 4)
(fast-expt 2 5)
(fast-expt 2 10)
(fast-expt 2 20)
(fast-expt 3 20)