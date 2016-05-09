#lang typed/racket/base

(provide

  email->string

  university->string
  university-name

  person->short-name
  person->full-name
  person->adjective

  person-short-name
  person-full-name
  person-title
  person->mailto
  person->href
  person->image
  pi->history
  student-university
  student->university-id

  make-student
  make-pi
  make-university
  make-conference

  venue->string

  (rename-out
   [make-publication publication]
   [publication-author* publication->author*]
   [publication-venue publication->venue])
  publication->name

  add-commas
  word*->string
  university*->string
  author*->string

  ->href
  make-href
  string->id
)

(require
  (only-in racket/list add-between)
  racket/string
  typed/net/url
  glob/typed
)

;; =============================================================================
;; --- Email Addresses

(struct email (
  [>string : String]
) #:transparent)

(define LETTER "[a-zA-Z0-9-]")
(define LETTER+ (string-append LETTER "+"))
(define DOMAIN (string-append LETTER+ "\\." LETTER+))
(define LOCALPART "[^@]+")
(define RX-EMAIL (pregexp (string-append "^" LOCALPART "@" LOCALPART "$")))

(: email-address? (-> String Boolean))
(define (email-address? str)
  (regexp-match? RX-EMAIL str))

(: string->email (-> String Email))
(define (string->email str)
  (unless (email-address? str)
    (raise-argument-error 'string->email "email-address?" str))
  (email str))

;; -----------------------------------------------------------------------------
;; --- Universities

(struct university (
  [name : String]
  [href : URL]
) #:transparent )
(define-type University university)

(: make-university (-> String #:href String University))
(define (make-university name
                         #:href href)
  (university name (string->url href)))

(: university->string (-> University String))
(define (university->string uni)
  (make-href (university-href uni) (university-name uni)))

;; -----------------------------------------------------------------------------
;; --- Types for people / students / professors

(define-type Year Natural)
(define-type Degree (U 'phd 'diplom 'ms 'msc 'postdoc 'bs 'bsc))
(define-type D+ (List Degree University Year))
(define-type Degree* (Listof D+))
(define-type Email email)
(define-type P+ (List University Year))
(define-type Position* (Listof P+))

(: degree-year (-> (List Degree University Year) Year))
(define (degree-year d)
  (caddr d))

(: position-year (-> (List University Year) Year))
(define (position-year p)
  (cadr p))

(struct person (
  [short-name : String]
  [full-name  : String]
  [gender     : Symbol]
  [title      : String]
  [mailto     : Email]
  [href       : URL]
  [degree*    : Degree*]
) #:transparent )
(define-type Person person)

(struct student person (
  [university : University]
) #:transparent )
(define-type Student student)

(struct pi person (
  [position* : Position*]
) #:transparent )
(define-type PI pi)

;; -----------------------------------------------------------------------------
;; --- Functions for people

(: make-pi (->* [String #:mailto String #:href String #:degree* Degree* #:position* Position* #:title String] [#:full-name (U #f String) #:gender Symbol] PI))
(define (make-pi short-name
                 #:mailto    mailto
                 #:href      href
                 #:degree*   degree*
                 #:position* position*
                 #:title title
                 #:gender    [gender 'M]
                 #:full-name [full-name #f])
  (pi short-name
      (or full-name short-name)
      gender
      title
      (string->email mailto)
      (string->url href)
      ((inst sort D+ Year) degree* > #:key degree-year)
      ((inst sort P+ Year) position* > #:key position-year)))

(: make-student (->* [String #:university University #:title (U Degree String) #:mailto String #:href String #:degree* Degree*] [#:full-name (U #f String) #:gender Symbol] Student))
(define (make-student short-name
                      #:university uni
                      #:title     title
                      #:mailto    mailto
                      #:href      href
                      #:degree*   degree*
                      #:gender    [gender 'M]
                      #:full-name [full-name #f])
  (student short-name
           (or full-name short-name)
           gender
           (cond
            [(string? title) title]
            [(eq? 'postdoc title) (degree->string title)]
            [else (string-append (degree->string title) " Student")])
           (string->email mailto)
           (string->url href)
           degree*
           uni))

(: person->short-name (-> Person String))
(define (person->short-name p)
  (make-href (person-href p) (person-short-name p)))

(: person->full-name (-> Person String))
(define (person->full-name p)
  (make-href (person-href p) (person-full-name p)))

;; Person => His/Her
(: person->adjective (-> Person String))
(define (person->adjective p)
  (case (person-gender p)
    [(M) "his"]
    [(F) "her"]
    [else "their"]))

(: pi->history (-> PI (Listof String)))
(define (pi->history pi)
  (append (for/list : (Listof String)
                    ([p (in-list (pi-position* pi))])
            (P+->string p))
          (for/list : (Listof String)
                    ([d (in-list (person-degree* pi))]
                     #:when (phd? d))
            (D+->string d))))

(: phd? (-> D+ Boolean))
(define (phd? d+)
  (eq? 'phd (car d+)))

(: P+->string (-> P+ String))
(define (P+->string pos)
  (format "Joined ~a, ~a" (university->string (car pos)) (cadr pos)))

(: D+->string (-> D+ String))
(define (D+->string d+)
  (format "~a, ~a, ~a" (degree->string (car d+)) (university->string (cadr d+)) (caddr d+)))

(: degree->string (-> Degree String))
(define (degree->string d)
  (case d
   [(phd) "Ph.D"]
   [(diplom) "Diplom"]
   [(ms) "M.S."]
   [(msc) "M.Sc."]
   [(postdoc) "Post-doc"]
   [(bs) "B.S."]
   [(bsc) "B.Sc."]
   [else (raise-argument-error 'degree->string "Unknown degree" d)]))

(: person->image (-> Person String))
(define (person->image p)
  (define id (string->id (person-short-name p)))
  (define pic* (glob (string-append "images/people/" id "*")))
  (if (null? pic*)
    "images/people/unknown.png"
    (begin
      (unless (null? (cdr pic*))
        (printf "WARNING: found multiple images matching '~a': ~a\n" id pic*))
      (car pic*))))

(: person->href (-> Person String))
(define (person->href pi)
  (define href (url->string (person-href pi)))
  (make-href href href))

(: person->mailto (-> Person String))
(define (person->mailto pi)
  (define mailto (email->string (person-mailto pi)))
  (make-href mailto mailto))

(: student->university-id (-> Student Symbol))
(define (student->university-id s)
  (string->symbol (university-name (student-university s))))

;; -----------------------------------------------------------------------------
;; --- Venue

(struct venue (
  [name : String]
  [year : Year]
  [href : URL]
) #:transparent )
(define-type Venue venue)

(struct conference venue () #:transparent)
(define-type Conference conference)

(: make-conference (-> String #:year Year #:href String Conference))
(define (make-conference name #:year year #:href href)
  (conference name year (string->url href)))

(: venue->string (-> Venue String))
(define (venue->string vnu)
  (make-href (venue-href vnu) (format "~a ~a" (venue-name vnu) (venue-year vnu))))

;; -----------------------------------------------------------------------------
;; --- Publications

(struct publication (
  [name : String]
  [href : URL]
  [author* : (Listof Person)]
  [venue : Venue]
) #:transparent )
(define-type Publication publication)

(: publication->year (-> Publication Year))
(define (publication->year pub)
  (venue-year (publication-venue pub)))

(: make-publication (-> #:title String #:href String #:author (U Person (Listof Person)) #:venue Venue Publication))
(define (make-publication #:title title #:href href #:author author #:venue venue)
  (publication title (string->url href) (if (list? author) author (list author)) venue))

(: publication->name (-> Publication String))
(define (publication->name pub)
  (make-href (publication-href pub) (publication-name pub)))

(: word*->string (-> (Listof String) String))
(define (word*->string w*)
  (add-commas w* (lambda ([x : String]) x)))

(: author*->string (-> (Listof Person) String))
(define (author*->string a*)
  (add-commas a* person->full-name))

(: university*->string (-> (Listof University) String))
(define (university*->string u*)
  (add-commas u* university->string))

(: add-commas (All (A) (-> (Listof A) (-> A String) String)))
(define (add-commas a* fmt)
  (cond
   [(null? a*)
    (raise-argument-error 'add-commas "Expected non-empty list of authors" a*)]
   [(null? (cdr a*))
    (fmt (car a*))]
   [(null? (cddr a*))
    (string-append (fmt (car a*))
                   " and "
                   (fmt (cadr a*)))]
   [else
    (string-join ((inst add-between String String) (map fmt a*) ", " #:before-last ", and ") "")]))

;; -----------------------------------------------------------------------------
;; --- Misc

(: ->href (-> (U Venue Publication Person University) String))
(define (->href val)
  (cond
   [(venue? val)
    (venue->string val)]
   [(person? val)
    (person->short-name val)]
   [(publication? val)
    (publication->name val)]
   [(university? val)
    (university->string val)]
   [else
    (raise-argument-error '->href "Cannot convert value to href" val)]))

(: make-href (->* [(U URL String) String] [#:other String] String))
(define (make-href href text #:other [other ""])
  (define str (if (url? href) (url->string href) href))
  (string-append
    "<a " other " href=\"" str "\">" text "</a>"))

(: string->id (-> String String))
(define (string->id str)
  (string-join (string-split (string-downcase str)) "-"))

;; =============================================================================

(module+ test
  (require typed/rackunit rackunit-abbrevs/typed)

  (check-apply* email-address?
   ["bob@bob.bob"
    => #t]
   ["obama@whitehouse.gov"
    => #t]
   ["HELLO-world@x.x"
    => #t]
   [""
    => #f]
   ["@@@"
    => #f]
   [".."
    => #f])

  (let ([str "yolo@wepa.net"])
    (check-equal? (email->string (string->email str)) str))
)

