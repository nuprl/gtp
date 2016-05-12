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

@(define (news-and-events . e*)
   @div[class: "col-md-4"]{
     @h3[class: "red-back"]{News and Events}
     @(map event->string e*)})

@(define (event->string e)
   ;; Some day will have more structured events. Pretty sure.
   @div[class: "col-md-12 card" e])

@(define (pi-meeting #:location location #:date [date #f] #:schedule [schedule #f])
  (list*
    "Upcoming PI meeting at "
    (->href location)
    (if date (string-append ", " date ".") ".")
    (if schedule (list " " @a[href: schedule "[Schedule]"]) '())))

@; =============================================================================

@page[0]{
  @div[class: "row"]{
    @div[class: "col-md-12"]{
      @h2[class: "main-h2"]{
        We are a @b{coalition} of researchers seeking to discover the
        @b{unifying principles} underlying the design of gradual type
        systems through reproducability studies, @b{implementations} of
        type systems and tools, plus @b{evaluations} covering both the
        @b{feasibility} of gradual typing as well as its @b{long-term value}
        to software engineers.
  }}}
  @div[class: "row"]{
    @; TODO these need dates
    @research-highlights[
      @to-appear[@publication[
        #:title "Just-in-Time Static Type Checking for Dynamic Languages"
        #:author (list brianna-ren jfoster)
        #:href "http://www.cs.umd.edu/~jfoster/papers/pldi16.pdf"
        #:venue pldi-2016
      ]]
      @to-appear[@publication[
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
        #:location ecoop-2016
      ]
      @pi-meeting[
        #:date "2016-05-17"
        #:location northeastern-university
        #:schedule "pi2016/pi2016.html"
      ]
    ]
}}
