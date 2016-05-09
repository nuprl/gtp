#lang scribble/text
@require["templates.rkt" racket/string]


@(define (principal-investigators . index->pi*)
  (string-append
      "<div id=\"content\">\n"
      (string-join
        (for/list ([index->pi (in-list index->pi*)]
                   [i (in-naturals)])
          (index->pi i)) "\n")
      "  <div class=\"col-md-12 devider\"></div>"
      "</div>\n"))

@(define ((pi->string pi . bio*) n)
   (define pic-on-left? (even? n))
   (define image-elem
     (string-append
       "<div class=\"col-md-3\">\n"
       "  <img class=\"img-responsive prof-icon\" src=\"" (person->image pi) "\" />\n"
       "</div>\n"))
   (define bio-elem
     (string-append
       "<div class=\"col-md-12 bio\"><p>\n"
         (string-join bio*)
       "</p></div>\n"))
   (define history-elem
     (string-append
       "<div class=\"col-md-6 info-2" (if pic-on-left? " col-md-offset-3" "") "\">\n"
          (string-join (pi->history pi) " <br />") "\n"
       "</div>\n"))
   (define position-elem
     (string-append
       "<div class=\"col-md-3 info-1" (if pic-on-left? "" " col-md-offset-1") "\">\n"
          (person-title pi) "<br />\n"
          (person->mailto pi) "<br />\n"
          (person->href pi)
       "</div>\n"))
   (string-append
     "<div class=\"col-md-12\">\n"
     "  <h3 class=\"red-back-big\">" (person-short-name pi) "</h3>\n"
     (if pic-on-left?
       (string-append
         image-elem
         "<div class=\"col-md-9\">\n"
         position-elem
         history-elem
         bio-elem
         "</div>\n")
       (string-append
         "<div class=\"col-md-9\">\n"
         history-elem
         position-elem
         bio-elem
         "</div>\n"
         image-elem))
     "</div>\n"))

@; =============================================================================

@default-doctype[]
<html lang="en">
  @header[]
  <body id="@|body-id|">
    @nav["People"]
    <!-- Body -->
    <div class="body-content">
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
      @sponsors[]
      @footer[]
    </div>
  </body>
</html>
