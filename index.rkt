#lang scribble/text
@require["templates.rkt" racket/string]


@(define (phddefense p)
   (string-append (person->short-name p) " successfully defended " (person->adjective p) " dissertation."))

@(define (research-highlights . h*)
   (string-append
     "<div class=\"col-md-8\"> <h3 class=\"red-back\">Research Highlights</h3>\n"
     (apply string-append
       (for/list ([h (in-list h*)])
         (string-append
           "<div class=\"card\">"
           (if (string? h) h (->href h))
           "</div>\n")))
     "</div>\n"))

@(define (to-appear p)
   (string-append
     (publication->name p)
     " by "
     (author*->string (publication->author* p))
     " to appear at "
     (venue->string (publication->venue p))))

@(define (news-and-events . e*)
   (string-append
     "<div class=\"col-md-4\"> <h3 class=\"red-back\">News and Events</h3>\n"
     (apply string-append (map event->string e*))
     "</div>\n"))

@(define (event->string e)
   ;; Some day will have more structured events. Pretty sure.
   (string-append
     "<div class=\"col-md-12 card\">\n"
     e
     "</div>\n"))

@(define (pi-meeting #:location location #:date [date #f] #:schedule [schedule #f])
  (string-append
    "Upcoming PI meeting at "
    (->href location)
    (if date (string-append ", " date ".") ".")
    (if schedule @make-href[schedule " [Schedule]"] "")))

@; =============================================================================

@default-doctype[]
<html lang="en">
  @header[]
  <body id="@|body-id|">
    @nav["Home"]
    <div class="body-content">
      <div id="content">
        <div class="row">
          <div class="col-md-12">
            <h2 class="main-h2">
              We are a <b>coalition</b> of researchers seeking to discover the
              <b>unifying principles</b> underlying the design of gradual type
              systems through reproducability studies, <b>implementations</b> of
              type systems and tools, plus <b>evaluations</b> covering both the
              <b>feasibility</b> of gradual typing as well as its <b>long-term value</b>
              to software engineers.
            </h2>
          </div>
        </div>
        <div class="row">
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
            @to-appear[@publication[
              #:title "Practical Optional Types for Clojure"
              #:author (list ambrosebs samth rowan-davies)
              #:href "http://frenchy64.github.io/papers/esop16-short.pdf"
              #:venue esop-2016
            ]]
            @to-appear[@publication[
              #:title "The Gradualizer: a methodology and algorithm for generating gradual type systems"
              #:author (list matteo-cimini siek)
              #:href "https://dl.dropboxusercontent.com/u/10275252/gradualizer-popl16.pdf"
              #:venue popl-2016
            ]]
            @to-appear[@publication[
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
        </div>
      </div>
      @sponsors[(format "Supported by the National Science Foundation (~a)" AWARD-NUMBER)]
      @footer[]
    </div>
  </body>
</html>
