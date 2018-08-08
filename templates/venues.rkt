#lang typed/racket/base

(provide (all-defined-out))

(require "datatypes.rkt")

;; =============================================================================

(define dls-2018
  (make-workshop "DLS" #:year 2018 #:href "https://conf.researchr.org/track/dls-2018/dls-2018"))

(define oopsla-2018
  (make-conference "OOPSLA" #:year 2018 #:href "https://2018.splashcon.org"))

(define icfp-2018
  (make-conference "ICFP" #:year 2018 #:href "https://conf.researchr.org/home/icfp-2018"))

(define ecoop-2018
  (make-conference "ECOOP" #:year 2018 #:href "https://2018.ecoop.org/"))

(define pepm-2018
  (make-workshop "PEPM" #:year 2018 #:href "https://popl18.sigplan.org/track/PEPM-2018"))

(define vmcai-2018
  (make-conference "VMCAI" #:year 2018 #:href "https://popl18.sigplan.org/track/VMCAI-2018"))

(define popl-2018
  (make-conference "POPL" #:year 2018 #:href "https://popl18.sigplan.org/home"))

(define icfp-2017
  (make-conference "ICFP" #:year 2017 #:href "https://conf.researchr.org/home/icfp-2017"))

(define oopsla-2017
  (make-conference "OOPSLA" #:year 2017 #:href "https://2017.splashcon.org/track/splash-2017-OOPSLA"))

(define popl-2017
  (make-conference "POPL" #:year 2017 #:href "http://conf.researchr.org/home/POPL-2017"))

(define pldi-2016
  (make-conference "PLDI" #:year 2016 #:href "http://conf.researchr.org/home/pldi-2016"))

(define popl-2016
  (make-conference "POPL" #:year 2016 #:href "http://conf.researchr.org/home/POPL-2016"))

(define esop-2016
  (make-conference "ESOP" #:year 2016 #:href "http://www.etaps.org/index.php/2016/esop"))

(define ecoop-2016
  (make-conference "ECOOP" #:year 2016 #:href "http://2016.ecoop.org"))

(define stop-2016
  (make-conference "STOP" #:year 2016 #:href "http://2016.ecoop.org/track/STOP-2016"))

