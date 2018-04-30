#lang scribble/html
@require["templates.rkt"]


@(define (benchmark-suites . p*)
  @(list
     @h3[class: "red-back-big"]{Benchmarks}
     @(map benchmarks->string p*)))

@(struct suite [name href publication* description] #:transparent)

@(define (benchmarks #:name name #:href href #:publications pub* desc)
   (suite name href pub* desc))

@(define (suite->id p)
   (string->id (suite-name p)))

@(define (benchmarks->string bm)
   (define id (suite->id bm))
   (define href (suite-href bm))
   @div[class: "col-md-12"]{
     @h3[id: id class: "gray-back"]{@suite-name[bm]}
     @div[class: "col-md-12 card"]{
       @p{@a[href: href class: "project-link" target: "_blank" href]}
       @suite-description[bm]
       Appeared in:
       @(apply ul
               (for/list ((pub (in-list (suite-publication* bm))))
                 (li (format-publication pub))))}})

@(define (format-publication p)
   (list
     (publication->name p)
     ". "
     (author*->string (publication->author* p))
     ". "
     (venue->string (publication->venue p))))

@(define (format-publication/short p)
   (publication->name p))

@; =============================================================================

@page[3]{
  @benchmark-suites[
    @benchmarks[
      #:name "Reticulated Python"
      #:href "https://github.com/nuprl/retic_performance?path=benchmarks"
      #:publications (list gm-pepm-2018)
      @(list @p{
        Suite of Python programs adapted from:
         case studies reported by @a[href: "https://dl.acm.org/citation.cfm?id=2661101"]{Vitousek, Kent, Siek, and Baker};
         the module-level evaluation of @format-publication/short[vss-popl-2017 ];
         and open-source programs.
        Each function in these benchmarks may be typed or untyped.
        In other words, for a program with 10 functions the benchmark explores
         1024 configurations of gradual typing.
      })]
    @benchmarks[
      #:name "Typed Racket"
      #:href "https://github.com/bennn/gtp-benchmarks"
      #:publications (list tfgnvf-popl-2016 bbst-oopsla-2017)
    @(list @p{
      Suite of Typed Racket programs adapted from open-source projects.
      Each module in these benchmarks may be typed or untyped.
    })]
  ]}
