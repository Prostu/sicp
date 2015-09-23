#lang planet neil/sicp

(define (square x) (* x x))
(define make-point cons)
(define x-point car)
(define y-point cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
(define (segment-length x)
  (sqrt (+ (square (- (x-point (start-segment x)) (x-point (end-segment x))))
           (square (- (y-point (start-segment x)) (y-point (end-segment x)))))))

(define my-segment (make-segment (make-point 2 2) (make-point 2 4)))
(segment-length my-segment)

(define (make-rectangle segment height)
  (cons segment height))
(define (rect-length x) (segment-length (car x)))
(define rect-height cdr)

(define (perimeter x)
  (+ (* 2 (rect-height x))
     (* 2 (rect-length x))))

(define (area x)
  (* (rect-length x)
     (rect-height x)))

(define my-rectangle
  (make-rectangle my-segment 2))

(perimeter my-rectangle)
(area my-rectangle)

; alternative representation: point, length, height, radians
; alternative representation: point, point, point
; alternative representation: point, point, radians