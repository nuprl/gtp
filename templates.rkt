#lang scribble/html

@; Provides HTML templates and common variables for pages

@provide[
  PROJECT-NAME
  AWARD-HREF
  AWARD-NUMBER
  ;; constants

  ---
  ;; mdash

  page
  ;; (-> Natural . Any Html)

  (all-from-out "templates/datatypes.rkt")
  (all-from-out "templates/universities.rkt")
  (all-from-out "templates/principal-investigators.rkt")
  (all-from-out "templates/team-members.rkt")
  (all-from-out "templates/venues.rkt")
]

@require[
  scribble/html
  web-server/templates
  racket/string
  "templates/datatypes.rkt"
  "templates/misc.rkt"
  "templates/principal-investigators.rkt"
  "templates/team-members.rkt"
  "templates/universities.rkt"
  "templates/venues.rkt"
]

@; =============================================================================

@(define PROJECT-NAME "Gradual Typing Across the Spectrum")
@(define AWARD-HREF "http://www.nsf.gov/awardsearch/showAward?AWD_ID=1518844")
@(define AWARD-NUMBER "SHF 1518844")
@(define BODY-ID "top")
@(define PAGE-TITLE* '("Home" "About" "Research" "People" "Team"))
@(define --- @literal{&mdash;})

@; -----------------------------------------------------------------------------


@(define (header)
  @head{
    @meta[charset: "UTF-8"]
    @meta[name: "description" contents: PROJECT-NAME]
    @meta[name: "keywords" content: "programming, language, gradual, typing"]
    @title[PROJECT-NAME]
    @stylesheets["css/bootstrap.min.css"
                 "css/animate.css"
                 "css/custom.css"]
    @link[href: "http://fonts.googleapis.com/css?family=Ubuntu:300"
          rel: "stylesheet"
          type: "text/css"]
    @link[href: "http://fonts.googleapis.com/css?family=PT+Sans"
          rel: "stylesheet"
          type: "text/css"]
    @favicons["16x16" "32x32" "96x96"]
    @script[src: "js/wow.min.js"]
    @scripts["jquery.min" "bootstrap.min" "custom" "stellar"]})

@(define (stylesheets . href*)
  (for/list ([href (in-list href*)])
    @link[rel: "stylesheet" href: href]))

@(define (favicons . size*)
  (for/list ([size (in-list size*)])
    @link[rel: "icon" size: size href: (format "images/favicon-~a.png" size)]))

@(define (scripts . src*)
  (for/list ([src (in-list src*)])
    @script[type: "text/javascript" src: (format "js/~a.js" src)]))

@(define (sponsors page-title)
  @div[id: "sponsors" class: "col-md-12"]{
    @center{
      @h4[class: "red-back"
        (if (string=? page-title (car PAGE-TITLE*))
          (format "Supported by the National Science Foundation (~a)" AWARD-NUMBER)
          "")]}})

@(define (footer . val*)
  (apply element/not-empty 'footer val*))

@(define (make-footer)
    @footer[class: "col-md-12"]{
      @div[class: "container text-center"]{
        @hr{}
        @div[class: "copyright"]{
          @p[class: "text-center"]{
            @literal{©} Copyright Programming Research Laboratory 2016-2017 | made by
            @a[href: "http://www.catchexception.cz/"
               target: "_blank"]{
              Catchexception s.r.o.}}}
        @a[href: (string-append "#" BODY-ID)
           title: "To Top"]{
          @span[class: "glyphicon glyphicon-chevron-up"]}}})

@(define (nav current-page)
  @div[id: "menu"
       class: "menu-fixed"]{
    @span[id: "menu-icon"]{
      @span[class: "glyphicon glyphicon-menu-hamburger"]{}}
    @ul[(for/list ([p (in-list PAGE-TITLE*)]
                   [i (in-naturals 1)])
          @li[class: (if (string=? p current-page) "active" "")
              data-src: (format "./images/menu/item_~a.png" i)]{
            @a[href: (if (string=? p "Home")
                       "index.html"
                       (string-append (string-downcase p) ".html"))
                  p]})]})

@(define (page n . content)
  (unless (exact-nonnegative-integer? n)
    (raise-argument-error 'page "Natural number" n))
  (define page-title (list-ref PAGE-TITLE* n))
  (list
    @doctype{html}
    @html[lang: "en"]{
      @div[class: "body" data-stellar-background-ratio: "1.5"]
      @header[]
      @div[class: "main-header-container"]{
        @div[class: "shadow-back"]{
          @div[class: "main-logo"]{
            @img[class: "img-responsive pull-left"
                 alt: ""
                 src: "images/prl.png"]}
          @div[class: "main-header"]{
            @h1[PROJECT-NAME]}}}
      @body[id: BODY-ID]{
        @nav[page-title]
        @div[class: "body-content"]{
          @div[id: "content"]{@content}
        @sponsors[page-title]
        @make-footer[]
        @misc-scripts[] }}}))
