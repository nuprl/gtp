#lang typed/racket/base

(provide
  (all-defined-out))

(require
  "datatypes.rkt"
  "people.rkt"
  "venues.rkt")

(define kas-stop-2015
  (publication
   #:title " Towards Absolutely Efficient Gradually Typed Languages"
    #:author (list andre-kuhlenschmidt deyaaeldeen-almahallawi siek)
    #:href "https://2015.ecoop.org/event/stop2015-towards-absolutely-efficient-gradually-typed-languages"
    #:venue stop-2015))

(define kas-stop-2016
  (publication
   #:title " A Systematic Performance Evaluation of Gradually Typed Functions and References"
    #:author (list andre-kuhlenschmidt deyaaeldeen-almahallawi siek)
    #:href "https://2016.ecoop.org/event/stop-2016-a-systematic-performance-evaluation-of-gradually-typed-functions-and-references"
    #:venue stop-2016))

(define tfgnvf-popl-2016
  (publication
    #:title "Is Sound Gradual Typing Dead?"
    #:author (list asumu-takikawa daniel-feltey ben-greenman max-new jan-vitek matthias-felleisen)
    #:href "http://www.ccs.neu.edu/racket/pubs/popl16-tfgnvf.pdf"
    #:venue popl-2016))

(define vss-popl-2017
  (publication
    #:title "Big Types in Little Runtime"
    #:author (list michael-vitousek cameron-swords jeremy-siek)
    #:href "http://popl17.sigplan.org/event/popl-2017-papers-big-types-in-little-runtime"
    #:venue popl-2017))

(define bbst-oopsla-2017
  (publication
    #:title "Sound Gradual Typing Only Mostly Dead"
    #:author (list spenser-bauman carl-friedrich-bolz-tereick jeremy-siek sam-tobin-hochstadt)
    #:href "https://dl.acm.org/citation.cfm?doid=3152284.3133878"
    #:venue oopsla-2017))

(define gm-pepm-2018
  (publication
    #:title "On the Cost of Type-Tag Soundness"
    #:author (list ben-greenman zeina-migeed)
    #:href "https://popl18.sigplan.org/event/pepm-2018-on-the-cost-of-type-tag-soundness"
    #:venue pepm-2018))

(define kas-scheme-2018
  (publication
   #:title "An Efficient Compiler for Gradually-Typed Lambda Calculus"
    #:author (list andre-kuhlenschmidt deyaaeldeen-almahallawi siek)
    #:href "https://icfp18.sigplan.org/event/scheme-2018-papers-toward-efficient-gradual-typing"
    #:venue scheme-2018))
