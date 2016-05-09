#lang typed/racket/base

(provide (all-defined-out))

(require "datatypes.rkt")

;; =============================================================================

(define pldi-2016
  (make-conference "PLDI" #:year 2016 #:href "http://conf.researchr.org/home/pldi-2016"))

(define popl-2016
  (make-conference "POPL" #:year 2016 #:href "http://conf.researchr.org/home/POPL-2016"))

(define esop-2016
  (make-conference "ESOP" #:year 2016 #:href "http://www.etaps.org/index.php/2016/esop"))

(define ecoop-2016
  (make-conference "ECOOP" #:year 2016 #:href "http://2016.ecoop.org"))

