#lang planet neil/sicp

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (inc test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (square x) (* x x))

(smallest-divisor 7)
(smallest-divisor 9)
(smallest-divisor 16)

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 7)
(prime? 17)
(prime? 21)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base (expmod base (dec exp) m))
                         m))))

(expmod 10 5 2)
(expmod 10 2 5)
(expmod 7 2 5)