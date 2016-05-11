#lang scribble/html
@require["templates.rkt"]


@(define (team-members . tm*)
   (for/list ([u+s* (in-list (group-by-university tm*))])
     (student*->string (reverse (cdr u+s*)))))

@(define (student*->string s*)
   (define u (student-university (car s*)))
   @div[class: "col-md-12"]{
     @h3[class: "red-back-big"]{
       @university-name[u]}
     @(map student->string s*)})

@(define (student->string s)
   @div[class: "col-md-6"]{
     @div[class: "col-md-4"]{
       @img[class: "img-responsive student-icon"
            src: (person->image s)]}
     @div[class: "col-md-8 info-1"]{
       @(add-between
         (list (person-short-name s)
               (person-title s)
               (person->href s))
         @br[])}})

@(define (group-by-university tm*)
   (define H (make-hasheq))
   (for ([tm (in-list tm*)])
     (define uni (student->university-id tm))
     (hash-set! H uni (cons tm (hash-ref H uni (lambda () '())))))
   (sort (hash->list H) symbol<? #:key car))

@(define (admissions u+href*)
  @ul[
    @(for/list ([u+href (in-list u+href*)])
      (define u (car u+href))
      (define href (cadr u+href))
      @li[@a[href: href]{@university-name[u] admissions.}])])

@; =============================================================================

@page[4]{
  @div[class: "col-md-12"]{
    @h3[class: "red-back-big"]{Your Name Here}
    @div[class: "col-md-12"]{
      @div[class: "col-md-2"]{
        @img[class: "img-responsive student-icon"
             src: "images/people/unknown.png"]}
      @div[class: "col-md-10"]{
        @div[class: "bio"]{
          @p{
            We are actively seeking talented students and researchers
            at all levels.
            Stop by one of @a[href: "people.html"]{our} offices if
            you're in town, or visit our websites to learn how to apply
            for your Masters, Ph.D, or post-doc.
          }
          @admissions[`(
            (,brown-university "https://www.brown.edu/academics/gradschool/apply")
            (,indiana-university "http://www.soic.indiana.edu/graduate/admissions/how-to-apply/computer-science.html")
            (,northeastern-university "http://www.ccis.northeastern.edu/academics/phd/phd-apply/")
            (,university-of-maryland "https://gradschool.umd.edu/admissions")
          )]}}}}
  @; 2016-05-10: Sorting members manually, for now
  @team-members[
    ;; -- UMD
    brianna-ren
    ;; -- IU
    david-christiansen
    matteo-cimini
    ambrosebs
    andre-kuhlenschmidt
    andrew-kent
    michael-vitousek
    spenser-bauman
    caner-derici
    rajan-walia
    zeina-migeed
    da
    ;; -- Brown
    jack-wrenn
    justin-pombrio
    matthew-kolosick
    ;; -- NEU
    stephen-chang
    asumu-takikawa
    benjamin-chung
    ben-greenman
    alex-knauth

    ;; -- alumni
    ;david-kempe-II
    ;earl-dean
  ]
  @;@div[class: "col-md-12 devider"]))
  @div[class: "col-md-12"]{@p{}}
}
