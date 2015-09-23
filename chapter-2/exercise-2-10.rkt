#lang planet neil/sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (= 0 (width y))
      (error "division by zero")
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (width z) (/ (- (upper-bound z) (lower-bound z)) 2))
(define (make-interval a b) (cons a b))
(define (upper-bound z) (cdr z))
(define (lower-bound z) (car z))

(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval 4.465 4.935))

(define (inverse z)
  (div-interval (make-interval 1.0 1.0) z))

(inverse (add-interval (inverse r1) (inverse r2)))

(div-interval r1 (make-interval 1.0 1.0))