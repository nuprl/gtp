#lang typed/racket/base

(provide
  Year
  Email
  Degree Degree*
  Position*

  (struct-out university)
  northeastern-university
  indiana-university
  brown-university
  purdue-university
  university-of-maryland
  university-of-arizona
  university-of-geneva
  university-of-victoria
  university-of-notre-dame
  rice-university
  th-karlsruhe

  (struct-out person)

  (struct-out pi)
  samth sam-tobin-hochstadt
  matthias matthias-felleisen
  jan jan-vitek
  jfoster jeff-foster
  siek jeremy-siek
  sk shriram-krishnamurthi

  (struct-out student)
)

(require
  typed/net/url
)

(module+ test
  (require typed/rackunit rackunit-abbrevs/typed))

;; =============================================================================

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

(module+ test
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

;; -----------------------------------------------------------------------------

(struct university (
  [name : String]
  [href : URL]
) #:transparent )
(define-type University university)

(: make-university (-> String #:href String University))
(define (make-university name
                         #:href href)
  (university name (string->url href)))

(define northeastern-university
  (make-university "Northeastern University"
                   #:href "http://www.ccis.northeastern.edu/"))

(define indiana-university
  (make-university "Indiana University"
                   #:href "http://cs.indiana.edu"))

(define brown-university
  (make-university "Brown University"
                   #:href "http://cs.brown.edu"))

(define university-of-maryland
  (make-university "University of Maryland, College Park"
                   #:href "http://cs.umd.edu"))

(define university-of-arizona
  (make-university "University of Arizona"
                   #:href "http://arizona.edu"))

(define rice-university
  (make-university "Rice University"
                   #:href "http://www.cs.rice.edu"))

(define university-of-colorado
  (make-university "University of Colorado, Boulder"
                   #:href "http://www.colorado.edu/cs/"))

(define th-karlsruhe
  (make-university "TH Karlsruhe"
                   #:href "http://www.kit.edu/english"))

(define purdue-university
  (make-university "Purdue University"
                   #:href "http://www.cs.purdue.edu"))

(define university-of-geneva
  (make-university "University of Geneva"
                   #:href "http://www.unige.ch/international/en/"))

(define university-of-victoria
  (make-university "University of Victoria"
                   #:href "http://www.uvic.ca/"))

(define university-of-notre-dame
  (make-university "University of Notre Dame"
                   #:href "http://www.nd.edu"))

(define uc-berkeley
  (make-university "University of California, Berkeley"
                   #:href "http://cs.berkeley.edu"))

;; -----------------------------------------------------------------------------

(define-type Year Natural)
(define-type Degree (U 'phd 'diplom 'ms 'msc 'postdoc 'bs))
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
  [mailto     : Email]
  [href       : URL]
  [degree*    : Degree*]
) #:transparent )

(struct student person ())
(define-type Student student)

(struct pi person (
  [position* : Position*]
) #:transparent )
(define-type PI pi)

(: make-pi (->* [String #:mailto String #:href String #:degree* Degree* #:position* Position*] [#:full-name (U #f String)] PI))
(define (make-pi short-name
                 #:mailto    mailto
                 #:href      href
                 #:degree*   degree*
                 #:position* position*
                 #:full-name [full-name #f])
  (pi short-name
      (or full-name short-name)
      (string->email mailto)
      (string->url href)
      ((inst sort D+ Year) degree* > #:key degree-year)
      ((inst sort P+ Year) position* > #:key position-year)))

(: make-student (->* [String #:mailto String #:href String #:degree* Degree*] [#:full-name (U #f String)] Student))
(define (make-student short-name
                      #:mailto    mailto
                      #:href      href
                      #:degree*   degree*
                      #:full-name [full-name #f])
  (student short-name
           (or full-name short-name)
           (string->email mailto)
           (string->url href)
           degree*))

(define matthias-felleisen
  (make-pi "Matthias Felleisen"
           #:mailto "matthias@ccs.neu.edu"
           #:href "www.ccs.neu.edu/home/matthias"
           #:degree*
             `((phd    ,indiana-university    1987)
               (diplom ,th-karlsruhe          1984)
               (ms     ,university-of-arizona 1981))
           #:position*
             `((,northeastern-university 2001)
               (,rice-university         1987))))
(define matthias matthias-felleisen)

(define jan-vitek
  (make-pi "Jan Vitek"
           #:mailto "j.vitek@neu.edu"
           #:href "http://janvitek.org"
           #:degree*
             `((phd ,university-of-geneva   1999)
               (msc ,university-of-victoria 1995))
           #:position*
             `((,northeastern-university 2014)
               (,purdue-university       1999))))
(define jan jan-vitek)

(define sam-tobin-hochstadt
  (make-pi "Sam Tobin-Hochstadt"
           #:mailto "samth@cs.indiana.edu"
           #:href "http://homes.soic.indiana.edu/samth"
           #:degree*
             `((phd ,northeastern-university 2010))
           #:position*
             `((,indiana-university 2013))))
(define samth sam-tobin-hochstadt)

(define jeremy-siek
  (make-pi "Jeremy Siek"
           #:mailto "jsiek@indiana.edu"
           #:href "http://wphomes.soic.indiana.edu/jsiek/"
           #:degree*
             `((postdoc ,rice-university          2005)
               (phd     ,indiana-university       2005)
               (ms      ,university-of-notre-dame 1999)
               (bs      ,university-of-notre-dame 1999))
           #:position*
             `((,university-of-colorado 2006)
               (,indiana-university     2013))))
(define siek jeremy-siek)

(define jeff-foster
  (make-pi "Jeff Foster"
           #:full-name "Jeffrey S. Foster"
           #:mailto "jfoster@cs.umd.edu"
           #:href "http://www.cs.umd.edu/~jfoster"
           #:degree*
             `((phd ,uc-berkeley 2002))
           #:position*
             `((,university-of-maryland 2002))))
(define jfoster jeff-foster)

(define shriram-krishnamurthi
  (make-pi "Shriram Krishnamurthi"
           #:mailto "sk@cs.brown.edu"
           #:href "https://cs.brown.edu/~sk/"
           #:degree*
             `((phd ,rice-university 2001))
           #:position*
             `((,brown-university 2000))))
(define sk shriram-krishnamurthi)

;; =============================================================================

(module+ test
  (check-equal? (university-name rice-university) "Rice University")

  (check-equal? (for/list : (Listof Year)
                          ([p (in-list (pi-position* jeremy-siek))])
                  (position-year p))
                '(2013 2006))

  (check-equal? (for/list : (Listof Year)
                          ([p (in-list (person-degree* jeremy-siek))])
                  (degree-year p))
                '(2005 2005 1999 1999))

  (check-equal? (degree-year (car (person-degree* shriram-krishnamurthi))) 2001)
  (check-equal? (position-year (car (pi-position* shriram-krishnamurthi))) 2000)
)
