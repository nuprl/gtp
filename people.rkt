#lang scribble/html
@require["templates.rkt"]


@(define (principal-investigators . index->pi*)
   @with-devider[(list
     @h3[class: "red-back-big"]{Principal Investigators}
     (for/list ([index->pi (in-list index->pi*)]
                [i (in-naturals)])
       (index->pi i))
     @div[class: "col-md-12 devider"])])

@(define ((pi->string pi . bio*) n)
   (define pic-on-left? (even? n))
   (define image-elem
     @div[class: "col-md-3"]{
       @img[class: "img-responsive prof-icon"
            src: (person->image pi)]})
   (define bio-elem
     @div[class: "col-md-12 bio"]{
       @p[bio*]})
   (define history-elem
     @div[class: (string-append "col-md-6 info-2 " (if pic-on-left? "col-md-offset-3" ""))]{
       @add-between[@pi->history[pi] @br[]]})
   (define position-elem
     @div[class: (string-append "col-md-3 info-1 " (if pic-on-left? "" " col-md-offset-1"))]{
       @list[@person-title[pi] @br[] @person->href[pi]]})
   @div[class: "col-md-12"]{
     @h3[class: "gray-back"]{
       @person-short-name[pi]}
     @(if pic-on-left?
       @(list
         @|image-elem|
         @div[class: "col-md-9"]{
           @|position-elem|
           @|history-elem|
           @|bio-elem|})
       @(list
         @div[class: "col-md-9"]{
           @|history-elem|
           @|position-elem|
           @|bio-elem|}
         @|image-elem|))})

@(define (red-back elem* #:title [title "Team Members"])
   @div[class: "col-md-12"]{
     @h3[class: "red-back-big"]{@|title|}
     @|elem*|})

@(define (team-members . tm*)
  @with-devider[
   @red-back[
     @(for/list ([u+s* (in-list (group-by-university tm*))])
        (student*->string (reverse (cdr u+s*))))]])

@(define (student*->string s*)
   (define u (student-university (car s*)))
   @div[class: "col-md-12"]{
     @h3[class: "gray-back"]{
       @university-name[u]}
     @(map student->string s*)})

@(define (student->string s #:alumnus? [alum? #f])
   @div[class: "col-md-6"]{
     @div[class: "col-md-4"]{
       @img[class: "img-responsive student-icon"
            src: (person->image s)]}
     @div[class: "col-md-8 info-1"]{
       @(add-between
         (list (person-short-name s)
               (if alum? (alma-mater s) (person-title s))
               (person->href s))
         @br[])}})

@(define (group-by-university tm*)
   (define H (make-hasheq))
   (for ([tm (in-list tm*)])
     (define uni (student->university-id tm))
     (hash-set! H uni (cons tm (hash-ref H uni (lambda () '())))))
   (sort (hash->list H) symbol<? #:key car))

@(define (alumni . p*)
  @with-devider[
   @red-back[#:title "Alumni"
     @(for/list ([p (in-list p*)])
       (student->string p #:alumnus? #t))]])

@(define (with-devider elem)
  @(cons @|elem| @div[class: "col-md-12 devider"]))

@; =============================================================================

@page[3]{
  @principal-investigators[
    @pi->string[samth]{
      My research focuses on the design and implementation of
      programming systems.
      I'm particularly interested in programming languages that
      support the evolution of software.
      I primarily work on Racket and Typed Racket as well as with
      Mozilla Research on JavaScript.
    }
    @pi->string[matthias]{
      I explore all aspects of program design and programming language design.
      My current research involves work on behavioral software contracts,
      gradual typing of scripting languages, language interoperability,
      language extensibility, and module systems.
      I also engage in educational outreach work.
      For the past 20 years, I have worked with middle schools,
      high schools, after-school programs, and college faculty on
      injecting design ideas into mathematics and computer science courses.
      Such educational interactions often inspire our research,
      and many research efforts end up improving my educational work.
    }
    @pi->string[jfoster]{
      I am a Professor in the Computer Science Department and UMIACS
      at the University of Maryland, College Park.
      I am a member of the programming languages group at Maryland.
      The goal of my research is to develop practical tools and
      techniques to improve software quality.
      I am interested in programming languages, software engineering,
      advanced static type systems, scalable constraint-based analysis,
      and building tools that implement my ideas.
    }
    @pi->string[jeremy-siek]{
      Associate Professor of Computer Science in the School of Informatics
      and Computing at Indiana University.
      Jeremy teaches courses in programming, programming languages, compilers,
      logic, and other areas of computer science.
      Jeremy designs new language features to help programmers create and
      use software libraries and domain-specific languages, especially generic
      and high-performance ones.
      In particular, Jeremy invented the gradual typing approach to mixing
      static and dynamic type checking within the same language.
      Prior to that, Jeremy authored the Boost Graph Library and attempted
      to add concepts to C++.
      Jeremy is a member of the Programming Languages Group at IU and the
      Center for Research in Extreme Scale Technologies.
    }
    @pi->string[sk]{
      Though my head is often in security, networking, verification,
      and HCI, my heart is in programming languages.
      Over the years I have contributed to several innovative and
      useful software systems: JavaScript and Web tools,
      Racket (formerly DrScheme), WeScheme, Margrave, Flapjax,
      FrTime, Continue, FASTLINK, and more.
    }
    @pi->string[jan-vitek]{
      I work on the design and implementation of programming languages.
      I led the implementation of the first real-time Java virtual
      machine to be flight-tested.
      With Noble and Potter, I proposed what became known as Ownership Types.
      I tried to understand JavaScript by dynamic analysis and am
      now looking at supporting scalable data analysis in R.
    }
  ]

  @; ===========================================================================
  @; 2016-05-10: Sorting members manually, for now
  @team-members[
    ;; -- UMD
    brianna-ren

    ;; -- IU
    david-christiansen
    matteo-cimini
    da
    spenser-bauman
    ambrosebs
    caner-derici
    andre-kuhlenschmidt
    andrew-kent
    michael-vitousek
    rajan-walia
    zeina-migeed

    ;; -- Brown
    jack-wrenn
    justin-pombrio
    matthew-kolosick
    philip-blair

    ;; -- NEU
    stephen-chang
    benjamin-chung
    ben-greenman
    alex-knauth

  ]

  @alumni[
    asumu-takikawa
    david-kempe-II
    earl-dean
    joe-gibbs-politz
  ]

  @; @div[class: "col-md-12 devider"]
}
