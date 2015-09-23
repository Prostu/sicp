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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1.0 1.0)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (make-center-percent c p)
  (let ((w (/ (* c p) 100)))
    (make-center-width c w)))

(define res-1 (make-center-percent 1.0 1))
(define res-2 (make-center-percent 2.0 1))

(par1 res-1 res-2)
(par2 res-1 res-2)

(div-interval res-1 res-1)
(div-interval res-1 res-2)
