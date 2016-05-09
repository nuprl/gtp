#lang typed/racket/base

(provide

  northeastern-university
  indiana-university
  brown-university
  university-of-maryland

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

  samth sam-tobin-hochstadt
  matthias matthias-felleisen
  jan-vitek
  jfoster jeff-foster
  siek jeremy-siek
  sk shriram-krishnamurthi

  student->university-id

  brianna-ren
  asumu-takikawa
  joe-gibbs-politz
  andrew-kent
  david-kempe-II
  ambrosebs
  rowan-davies
  matteo-cimini
  daniel-feltey
  ben-greenman
  max-new

  venue->string
  pldi-2016
  popl-2016
  esop-2016
  ecoop-2016

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

(module+ test
  (require typed/rackunit rackunit-abbrevs/typed))

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

(define northeastern-university
  (make-university "Northeastern University"
                   #:href "http://www.ccis.northeastern.edu/"))

(define northwestern-university
  (make-university "Northwestern University"
                   #:href "http://www.mccormick.northwestern.edu/eecs/computer-science/"))

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

(define carnegie-mellon-university
  (make-university "Carnegie Mellon University"
                   #:href "http://cs.cmu.edu"))

(define purdue-university
  (make-university "Purdue University"
                   #:href "http://www.cs.purdue.edu"))

(define reykjavik-university
  (make-university "Reykjavik University"
                   #:href "http://en.ru.is/scs/"))

(define cornell-university
  (make-university "Cornell University"
                   #:href "https://cs.cornell.edu"))

(define university-of-bologna
  (make-university "University of Bologna"
                   #:href "http://cse.unibo.it/en"))

(define university-of-geneva
  (make-university "University of Geneva"
                   #:href "http://www.unige.ch/international/en/"))

(define university-of-victoria
  (make-university "University of Victoria"
                   #:href "http://www.uvic.ca/"))

(define university-of-notre-dame
  (make-university "University of Notre Dame"
                   #:href "http://www.nd.edu"))

(define university-of-western-australia
  (make-university "University of Western Australia"
                   #:href "http://web.csse.uwa.edu.au/"))

(define university-of-british-columbia
  (make-university "University of British Columbia"
                   #:href "https://www.cs.ubc.edu"))

(define uc-berkeley
  (make-university "University of California, Berkeley"
                   #:href "http://cs.berkeley.edu"))

(define brigham-young-university
  (make-university "Brigham Young University"
                   #:href "https://cs.byu.edu"))

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
;; --- Default people

(define matthias-felleisen
  (make-pi "Matthias Felleisen"
           #:mailto "matthias@ccs.neu.edu"
           #:href "www.ccs.neu.edu/home/matthias"
           #:title "Trustee Professor"
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
           #:title "Professor"
           #:degree*
             `((phd ,university-of-geneva   1999)
               (msc ,university-of-victoria 1995))
           #:position*
             `((,northeastern-university 2014)
               (,purdue-university       1999))))

(define sam-tobin-hochstadt
  (make-pi "Sam Tobin-Hochstadt"
           #:mailto "samth@cs.indiana.edu"
           #:href "http://homes.soic.indiana.edu/samth"
           #:title "Assistant Professor"
           #:degree*
             `((phd ,northeastern-university 2010))
           #:position*
             `((,indiana-university 2013))))
(define samth sam-tobin-hochstadt)

(define jeremy-siek
  (make-pi "Jeremy Siek"
           #:mailto "jsiek@indiana.edu"
           #:href "http://wphomes.soic.indiana.edu/jsiek/"
           #:title "Associate Professor"
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
           #:title "Professor"
           #:degree*
             `((phd ,uc-berkeley 2002))
           #:position*
             `((,university-of-maryland 2002))))
(define jfoster jeff-foster)

(define shriram-krishnamurthi
  (make-pi "Shriram Krishnamurthi"
           #:mailto "sk@cs.brown.edu"
           #:href "https://cs.brown.edu/~sk/"
           #:title "Professor"
           #:degree*
             `((phd ,rice-university 2001))
           #:position*
             `((,brown-university 2000))))
(define sk shriram-krishnamurthi)

(define brianna-ren
  (make-student "Brianna Ren"
                #:title 'phd
                #:university university-of-maryland
                #:mailto "bren@cs.umd.edu"
                #:href "https://www.cs.umd.edu/~bren"
                #:degree* `()
                #:gender 'F))

(define asumu-takikawa
  (make-student "Asumu Takikawa"
                #:mailto "asumu@ccs.neu.edu"
                #:title 'phd
                #:university northeastern-university
                #:href "http://ccs.neu.edu/home/asumu"
                #:degree*
                  `((phd ,northeastern-university 2016)
                    (bsc ,university-of-british-columbia 2010))))

(define joe-gibbs-politz
  (make-student "Joe Gibbs Politz"
                #:mailto "joe@cs.brown.edu"
                #:university brown-university
                #:title 'phd
                #:href "http://jpolitz.github.io"
                #:degree*
                  `((phd ,brown-university 2016))))

(define andrew-kent
  (make-student "Andrew Kent"
                #:mailto "andmkent@indiana.edu"
                #:title 'phd
                #:university indiana-university
                #:href "http://andmkent.com"
                #:degree*
                  `((bs ,brigham-young-university 2013))))

(define david-kempe-II
  (make-student "David Kempe II"
                #:mailto "dkempe@indiana.edu"
                #:title "Student"
                #:university indiana-university
                #:href "https://www.linkedin.com/in/david-kempe-ii-54402129"
                #:degree* '()))

(define ambrose-bonnaire-sergeant
  (make-student "Ambrose Bonnaire-Sergeant"
                #:mailto "abonnairesergeant@gmail.com"
                #:title 'phd
                #:university indiana-university
                #:href "http://ambrosebs.com"
                #:degree* '()))
(define ambrosebs ambrose-bonnaire-sergeant)

(define rowan-davies
  ;; Technically, professor
  (make-student "Rowan Davies"
                #:mailto "Rowan.Davies@cba.com.au"
                #:title "Professor"
                #:university university-of-western-australia
                #:href "http://staffhome.ecm.uwa.edu.au/~00047175/"
                #:degree*
                  `((phd ,carnegie-mellon-university 2005)
                    (msc ,carnegie-mellon-university 1995))))

(define matteo-cimini
  (make-student "Matteo Cimini"
                #:mailto "mcimini@indiana.edu"
                #:href "http://cimini.info"
                #:title 'postdoc
                #:university indiana-university
                #:degree*
                  `((phd ,reykjavik-university 2011)
                    (msc ,university-of-bologna 2008))))

(define daniel-feltey
  (make-student "Daniel Feltey"
                #:mailto "daniel.feltey@eecs.northwestern.edu"
                #:href "https://github.com/dfeltey"
                #:title 'phd
                #:university northwestern-university
                #:degree*
                  `((ms ,northeastern-university 2015))))

(define ben-greenman
  (make-student "Ben Greenman"
                #:mailto "benjaminlgreenman@gmail.com"
                #:title 'phd
                #:university northeastern-university
                #:href "http://ccs.neu.edu/home/types"
                #:degree*
                  `((ms ,cornell-university 2014)
                    (bs ,cornell-university 2013))))

(define max-new
  (make-student "Max New"
                #:full-name "Max S. New"
                #:mailto "maxsnew@gmail.com"
                #:title 'phd
                #:university northeastern-university
                #:href "http://maxsnew.github.io"
                #:degree*
                  `((ms ,northwestern-university 2014)
                    (bs ,northwestern-university 2014))))

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

(define pldi-2016
  (make-conference "PLDI" #:year 2016 #:href "http://conf.researchr.org/home/pldi-2016"))

(define popl-2016
  (make-conference "POPL" #:year 2016 #:href "http://conf.researchr.org/home/POPL-2016"))

(define esop-2016
  (make-conference "ESOP" #:year 2016 #:href "http://www.etaps.org/index.php/2016/esop"))

(define ecoop-2016
  (make-conference "ECOOP" #:year 2016 #:href "http://2016.ecoop.org"))

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

  (check-equal? (person-full-name jan-vitek) "Jan Vitek")
  (check-true (regexp-match? "Jeff Foster" (person->short-name jfoster)))
  (check-true (regexp-match? "Jeffrey S. Foster" (person->full-name jfoster)))

  (check-apply* person->adjective
   [samth
    => "his"]
   [brianna-ren
    => "her"]
   [asumu-takikawa
    => "his"])

  (let ([h1 (pi->history matthias)]
        [h2 (pi->history siek)])
    (check-equal? (length h1) 3)
    (check-equal? (length h2) 3)
    (for ([h (in-list h1)]
          [q (in-list '("Northeastern" "Rice" "Ph.D"))])
      (check-true (regexp-match? q h)))
    (for ([h (in-list h2)]
          [q (in-list '("Indiana" "Colorado" "Indiana"))])
      (check-true (regexp-match? q h))))

)
