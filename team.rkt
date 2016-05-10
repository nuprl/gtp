#lang scribble/text
@require["templates.rkt" racket/string]


@(define (team-members . tm*)
   (string-join
     (for/list ([u+s* (in-list (group-by-university tm*))])
       (student*->string (reverse (cdr u+s*))))))

@(define (student*->string s*)
   (define u (student-university (car s*)))
   (string-append
     "<div class=\"col-md-12\">\n"
     "  <h3 class=\"red-back-big\">" (university-name u) "</h3>"
     (string-join (map student->string s*))
     "</div>"))

@(define (student->string s)
   (string-append
     "<div class=\"col-md-6\">\n"
     "  <div class=\"col-md-4\">\n"
     "    <img class=\"img-responsive student-icon\" src=\"" (person->image s) "\" />\n"
     "  </div>\n"
     "  <div class=\"col-md-8 info-1\">\n"
          (person-short-name s) "<br />\n"
          (person-title s) "<br />\n"
          (person->href s)
     "  </div>\n"
     "</div>\n"))

@(define (group-by-university tm*)
   (define H (make-hasheq))
   (for ([tm (in-list tm*)])
     (define uni (student->university-id tm))
     (hash-set! H uni (cons tm (hash-ref H uni (lambda () '())))))
   (sort (hash->list H) symbol<? #:key car))

@(define (admissions u+href*)
  (string-append
    "<ul>"
    (string-join
      (for/list ([u+href (in-list u+href*)])
        (define u (car u+href))
        (define href (cadr u+href))
        (string-append
          "<li>"
          @make-href[href (string-append @university-name[u] " admissions.")]
          "</li>")))
    "</ul>"))

@; =============================================================================

@default-doctype[]
<html lang="en">
  @header[]
  <body id="@|body-id|">
    @nav["Team"]
    <!-- Body -->
    <div class="body-content">
      <div id="content">
        <div class="col-md-12">
          <h3 class="red-back-big">Your Name Here</h3>
          <div class="col-md-12">
            <div class="col-md-2">
              <img class="img-responsive student-icon" src="images/people/unknown.png" />
            </div>
            <div class="col-md-10">
              <div class="bio">
                <p>
                  We are actively seeking talented students and researchers
                  at all levels.
                  Stop by one of @make-href["people.html" "our"] offices if
                  you're in town, or visit our websites to learn how to apply
                  for your Masters, Ph.D, or post-doc.
                </p>
                @admissions[`(
                  (,brown-university "https://www.brown.edu/academics/gradschool/apply")
                  (,indiana-university "http://www.soic.indiana.edu/graduate/admissions/how-to-apply/computer-science.html")
                  (,northeastern-university "http://www.ccis.northeastern.edu/academics/phd/phd-apply/")
                  (,university-of-maryland "https://gradschool.umd.edu/admissions")
                )]
              </div>
            </div>
          </div>
        </div>

        @; 2016-05-10: Sorting members manually, for now
        @team-members[
          ;; -- UMD
          brianna-ren
          ;; -- IU
          matteo-cimini
          ambrosebs
          andrew-kent
          david-kempe-II
          ;; -- Brown
          jack-wrenn
          justin-pombrio
          matthew-kolosick
          ;; -- NEU
          stephen-chang
          benjamin-chung
          ben-greenman
          alex-knauth
          zeina-migeed
        ]

        <div class="col-md-12"><p></p></div>
      </div>
      @sponsors[]
      @footer[]
    </div>
  </body>

  <!-- Mirrored from www.proposal.dev.catchx.cz/students.php by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 26 Apr 2016 11:06:16 GMT -->
</html>
