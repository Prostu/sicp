#lang planet neil/sicp

; or as I learned them: succ(essor) for f and `0` for x
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

zero
((zero inc) 0)
(((add-1 zero) inc) 0)
(((add-1 (add-1 zero)) inc) 0)
(add-1 zero)
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
(((lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))) inc) 0)
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(((lambda (f) (lambda (x) (f ((lambda (x) x) x)))) inc) 0)
(lambda (f) (lambda (x) (f x)))
(((lambda (f) (lambda (x) (f x))) inc) 0)

(define one (lambda (f) (lambda (x) (f x))))

((one inc) 0)

(define two (lambda (f) (lambda (x) (f (f x)))))

((two inc) 0)

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define three (add one two))
((three inc) 0)