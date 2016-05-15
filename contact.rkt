#lang scribble/html
@require["templates.rkt"]


@(define (admissions u+href*)
  @ul[
    @(for/list ([u+href (in-list u+href*)])
      (define u (car u+href))
      (define href (cadr u+href))
      @li[@a[href: href]{@university-name[u] admissions.}])])

@(define qa cons)

@(define (faq . qa*)
  @div[class: "col-md-12 card"]{
    @(for/list ([qa (in-list qa*)])
      @div[class: "col-md-12"]{
        @div[class: "col-md-6"]{@car[qa]}
        @div[class: "col-md-6"]{@cdr[qa]}})})

@; =============================================================================

@page[4]{

  @div[class: "col-md-12"]{
    @h3[class: "red-back-big"]{Get Involved}
    @div[class: "col-md-12 card"]{
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
  )]}}}

  @div[class: "col-md-12"]{
    @h3[class: "red-back-big"]{General Information}
    @faq[
      @;@qa["For the latest news on Racket"]{@p{
      @;  Sign up for the Racket @a[href: "https://lists.racket-lang.org/"]{mailing lists}}}
      @qa["For questions or comments about this website"]{
        @p{Email @tt{benjaminlgreenman} at @tt{gmail.com}.}}
    ]
  }
}
