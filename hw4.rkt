
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

; 1
(define (sequence low high stride)
  (if (> low high)
      empty
      (cons low (sequence (+ low stride) high stride))))

; 2
(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

; 3
(define (list-nth-mod xs n)
  (cond [(negative? n) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

; 4
#|Stream tester:
(define powers-of-two
  (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
    (lambda () (f 2))))
|#
(define (stream-for-n-steps s n)
  (if (<= n 0) null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

; 5
(define funny-number-stream
  (letrec ([f (lambda (x) (cons (if (= (remainder x 5) 0) (- x) x)
                                (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

; 6
(define dan-then-dog
  (letrec ([f (lambda (x) (cons x (lambda () (f (if (string=? "dan.jpg" x) "dog.jpg" "dan.jpg")))))])
    (lambda () (f "dan.jpg"))))

; 7
(define (stream-add-zero s)
  (letrec ([f (lambda (x) (cons
                (cons 0 (car (x)))
                (stream-add-zero (cdr (s)))))])
    (lambda () (f s))))

; 8
(define (cycle-lists xs ys)
  (define (aux n) (cons
                   (cons (list-nth-mod xs n) (list-nth-mod ys n))
                   (lambda () (aux (+ n 1)))))
  (lambda () (aux 0)))