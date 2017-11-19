#lang scribble/html
@require["templates.rkt"]


@(define (phddefense p)
   (list (person->short-name p)
         " successfully defended "
         (person->adjective p)
         " dissertation."))

@(define (research-highlights . h*)
   @div[class: "col-md-8"]{
     @h3[class: "red-back"]{Research Highlights}
     @(for/list ([h (in-list h*)])
       @div[class: "card"]{
         @(if (list? h) h (->href h))})})

@(define (format-publication p str)
   (list
     (publication->name p)
     " by "
     (author*->string (publication->author* p))
     (string-append " " str " ")
     (venue->string (publication->venue p))))

@(define (appeared p)
   (format-publication p "appeared at"))

@(define (to-appear p)
   (format-publication p "to appear at"))

@(define (spoke-at p* v)
  (list (author*->string p*) " spoke at " (venue->string v)))

@(define (news-and-events . e*)
   @div[class: "col-md-4"]{
     @h3[class: "red-back"]{News and Events}
     @(map event->string e*)})

@(define (event->string e)
   ;; Some day will have more structured events. Pretty sure.
   @div[class: "col-md-12 card" e])

@(define (pi-meeting #:location location #:date [date #f] #:schedule [schedule #f])
  (list*
    "PI meeting at "
    (->href location)
    (if date (string-append ", " date ".") ".")
    (if schedule (list " " @a[href: schedule "[Schedule]"]) '())))

@(define (upcoming rest)
  (cons "Upcoming " rest))

@; =============================================================================

@page[0]{
  @div[class: "row"]{
    @div[class: "col-md-12"]{
      @h2[class: "main-h2"]{
        We are a @b{coalition} of researchers seeking to discover the
        @b{unifying principles} underlying the design of gradual type
        systems through reproducibility studies, @b{implementations} of
        type systems and tools, plus @b{evaluations} covering both the
        @b{feasibility} of gradual typing as well as its @b{long-term value}
        to software engineers.
  }}}
  @div[class: "row"]{
    @research-highlights[
      @to-appear[@publication[
        #:title "Symbolic Types for Lenient Symbolic Execution"
        #:author (list stephen-chang alex-knauth emina-torlak)
        #:href "https://popl18.sigplan.org/event/popl-2018-papers-symbolic-types-for-lenient-symbolic-execution"
        #:venue popl-2018]]
      @to-appear[@publication[
        #:title "Refinement Types for Ruby"
        #:author (list milod-kazerounian niki-vazou austin-bourgerie jeff-foster emina-torlak)
        #:href "https://popl18.sigplan.org/track/VMCAI-2018#About"
        #:venue vmcai-2018]]
      @to-appear[@publication[
        #:title "On the Cost of Type-Tag Soundness"
        #:author (list ben-greenman zeina-migeed)
        #:href "https://popl18.sigplan.org/event/pepm-2018-on-the-cost-of-type-tag-soundness"
        #:venue pepm-2018]]
      @appeared[@publication[
        #:title "Automatically Generating the Dynamic Semantics of Gradually Typed Languages"
        #:author (list matteo-cimini jeremy-siek)
        #:href "http://popl17.sigplan.org/event/popl-2017-papers-automatically-generating-the-dynamic-semantics-of-gradually-typed-languages"
        #:venue popl-2017
      ]]
      @appeared[@publication[
        #:title "Big Types in Little Runtime"
        #:author (list michael-vitousek cameron-swords jeremy-siek)
        #:href "http://popl17.sigplan.org/event/popl-2017-papers-big-types-in-little-runtime"
        #:venue popl-2017
      ]]
      @appeared[@publication[
        #:title "Type Systems as Macros"
        #:author (list stephen-chang alex-knauth ben-greenman)
        #:href "http://www.ccs.neu.edu/home/stchang/popl2017/index.html"
        #:venue popl-2017
      ]]
      @spoke-at[(list jfoster jan andre-kuhlenschmidt michael-vitousek) stop-2016]
      @appeared[@publication[
        #:title "Just-in-Time Static Type Checking for Dynamic Languages"
        #:author (list brianna-ren jfoster)
        #:href "http://www.cs.umd.edu/~jfoster/papers/pldi16.pdf"
        #:venue pldi-2016
      ]]
      @appeared[@publication[
        #:title "Occurrence Typing Modulo Theories"
        #:author (list andrew-kent david-kempe-II samth)
        #:href "http://conf.researchr.org/event/pldi-2016/pldi-2016-papers-occurrence-typing-modulo-theories"
        #:venue pldi-2016
      ]]
      @phddefense[asumu-takikawa]
      @phddefense[joe-gibbs-politz]
      @appeared[@publication[
        #:title "Practical Optional Types for Clojure"
        #:author (list ambrosebs samth rowan-davies)
        #:href "http://frenchy64.github.io/papers/esop16-short.pdf"
        #:venue esop-2016
      ]]
      @appeared[@publication[
        #:title "The Gradualizer: a methodology and algorithm for generating gradual type systems"
        #:author (list matteo-cimini siek)
        #:href "https://dl.dropboxusercontent.com/u/10275252/gradualizer-popl16.pdf"
        #:venue popl-2016
      ]]
      @appeared[@publication[
        #:title "Is Sound Gradual Typing Dead?"
        #:author (list asumu-takikawa daniel-feltey ben-greenman max-new)
        #:href "http://www.ccs.neu.edu/racket/pubs/popl16-tfgnvf.pdf"
        #:venue popl-2016
      ]]
    ]

    @news-and-events[
      @pi-meeting[
        #:date "2017-08-07"
        #:location northeastern-university
        #:schedule "pi2017/pi2017.html"
      ]
      @pi-meeting[
        #:date "2016-05-17"
        #:location northeastern-university
        #:schedule "pi2016/pi2016.html"
      ]
    ]
}}
