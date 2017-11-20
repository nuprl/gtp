#lang typed/racket/base

(provide
  (all-defined-out)

  (rename-out
    (matthias-felleisen matthias)
    (jan-vitek jan)
    (sam-tobin-hochstadt samth)
    (shriram-krishnamurthi sk)
    (jeff-foster jfoster)
    (jeremy-siek siek)

    (ambrose-bonnaire-sergeant ambrosebs)
    (deyaaeldeen-almahallawi da)))

(require "datatypes.rkt" "universities.rkt")

;; =============================================================================
;; PIs

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

(define shriram-krishnamurthi
  (make-pi "Shriram Krishnamurthi"
           #:mailto "sk@cs.brown.edu"
           #:href "https://cs.brown.edu/~sk/"
           #:title "Professor"
           #:degree*
             `((phd ,rice-university 2001))
           #:position*
             `((,brown-university 2000))))

;; =============================================================================
;; students

(define anon "a@a.a")

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

(define andre-kuhlenschmidt
  (make-student "Andre Kuhlenschmidt"
                #:mailto "akuhlens@indiana.edu"
                #:title 'phd
                #:university indiana-university
                #:href "http://www.crest.iu.edu/node/164"
                #:degree* '()))

(define spenser-bauman
  (make-student "Spenser Bauman"
                #:mailto "sabauman@indiana.edu"
                #:title 'phd
                #:university indiana-university
                #:href "http://www.crest.iu.edu/node/194"
                #:degree* '()))

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
                #:title "Alumnus"
                #:university indiana-university
                #:href "https://www.linkedin.com/in/david-kempe-ii-54402129"
                #:degree*
                  `((msc ,indiana-university 2016))))

(define ambrose-bonnaire-sergeant
  (make-student "Ambrose Bonnaire-Sergeant"
                #:mailto "abonnairesergeant@gmail.com"
                #:title 'phd
                #:university indiana-university
                #:href "http://ambrosebs.com"
                #:degree* '()))

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

(define earl-dean
  (make-student "Earl Dean"
                #:title "Alumnus"
                #:university indiana-university
                #:href "https://www.linkedin.com/in/earldean"
                #:mailto anon
                #:degree*
                  `((msc ,indiana-university 2016))))

(define deyaaeldeen-almahallawi
  (make-student "Deyaaeldeen Almahallawi"
                #:title 'phd
                #:university indiana-university
                #:href "http://deyaaeldeen.github.io/"
                #:mailto "dalmahal@indiana.edu"
                #:degree*
                  '()))

(define michael-vitousek
  (make-student "Michael Vitousek"
                #:title 'phd
                #:university indiana-university
                #:href "http://homes.soic.indiana.edu/mvitouse/"
                #:mailto "mmvitousek@gmail.com"
                #:degree*
                  `()))

(define cameron-swords
  (make-student "Cameron Swords"
                #:title 'phd
                #:university indiana-university
                #:href "http://cswords.com/"
                #:mailto "cameronswords@gmail.com"
                #:degree*
                  `()))

(define caner-derici
  (make-student "Caner Derici"
                #:title 'phd
                #:university indiana-university
                #:href "http://caner.derici.me/"
                #:mailto "cderici@indiana.edu"
                #:degree*
                  '()))

(define rajan-walia
  (make-student "Rajan Walia"
                #:title 'phd
                #:university indiana-university
                #:href "http://www.soic.indiana.edu/graduate/directory/"
                #:mailto "rawalia@indiana.edu"
                #:degree*
                  '()))

(define david-christiansen
  (make-student "David Christiansen"
                #:title 'postdoc
                #:university indiana-university
                #:href "http://davidchristiansen.dk/"
                #:mailto "davidchr@indiana.edu"
                #:degree*
                  `((phd ,it-copenhagen 2016))))

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

(define benjamin-chung
  (make-student "Benjamin Chung"
                #:title 'phd
                #:university northeastern-university
                #:mailto "bchung@ccs.neu.edu"
                #:href "http://benchung.github.io/"
                #:degree* `((bs ,carnegie-mellon-university 2015))))

(define stephen-chang
  (make-student "Stephen Chang"
                #:title "Lecturer, Researcher"
                #:university northeastern-university
                #:mailto "stchang@ccs.neu.edu"
                #:href "http://www.ccs.neu.edu/home/stchang/"
                #:degree* `((phd ,northeastern-university 2014)
                            (me ,harvard-university 2008)
                            (bse ,princeton-university 2001))))

(define alex-knauth
  (make-student "Alex Knauth"
                #:title 'reu
                #:mailto "alexander@knauth.org"
                #:university northeastern-university
                #:href "https://github.com/AlexKnauth"
                #:degree* '()))

(define zeina-migeed
  (make-student "Zeina Migeed"
                #:title 'reu
                #:university indiana-university
                #:mailto "abdelmigeed.z@husky.neu.edu"
                #:href "http://github.com/migeed-z"
                #:degree* `((bs ,northeastern-university 2017))))

(define justin-pombrio
  (make-student "Justin Pombrio"
                #:title 'phd
                #:university brown-university
                #:mailto "justinlpombrio@gmail.com"
                #:href "http://justinpombrio.net/"
                #:degree* `((bs ,wpi 2011))))

(define philip-blair
  (make-student "Philip Blair"
                #:title 'reu
                #:university brown-university
                #:mailto "sud0@ccs.neu.edu"
                #:href "https://www.linkedin.com/in/blairphilip"
                #:degree* '()))

(define jack-wrenn
  (make-student "Jack Wrenn"
                #:title 'phd
                #:university brown-university
                #:mailto "johnswrenn@gmail.com"
                #:href "https://github.com/jswrenn"
                #:degree* '()))

(define matthew-kolosick
  (make-student "Matthew Kolosick"
                #:mailto "kolosick@ccs.neu.edu"
                #:title 'reu
                #:university brown-university
                #:href "https://github.com/mkolosick"
                #:degree* '()))

(define sarah-spall
  (make-student "Sarah Spall"
                #:title 'phd
                #:mailto anon
                #:university indiana-university
                #:href "https://github.com/spall"
                #:degree* '()))

(define di-zhong
  (make-student "Di Zhong"
                #:title 'reu
                #:mailto anon
                #:href "https://www.google.com"
                #:university indiana-university
                #:degree* '()))

(define preston-tunnell-wilson
  (make-student "Preston Tunnell Wilson"
                #:title 'phd
                #:mailto anon
                #:university brown-university
                #:href "https://cs.brown.edu/~ptunnell/"
                #:degree* '()))

(define sorawee-porncharoenwase
  (make-student "Sorawee Porncharoenwase"
                #:title 'reu
                #:mailto anon
                #:university brown-university
                #:href "https://github.com/sorawee/"
                #:degree* '()))

(define milo-turner
  (make-student "Milo Turner"
                #:title 'reu
                #:mailto anon
                #:university northeastern-university
                #:href "https://github.com/iitalics"
                #:degree* '()))

(define niki-vazou
  (make-student "Niki Vazou"
                #:title 'postdoc
                #:university university-of-maryland
                #:mailto anon
                #:href "https://nikivazou.github.io/"
                #:degree*
                  `((phd ,ucsd 2016))))

(define milod-kazerounian
  (make-student "Milod Kazerounian"
                #:title 'phd
                #:university university-of-maryland
                #:mailto anon
                #:href "https://www.cs.umd.edu/people/milod"
                #:degree*
                  `()))

(define brianna-ren
  (make-student "Brianna Ren"
                #:title 'phd
                #:university university-of-maryland
                #:mailto "bren@cs.umd.edu"
                #:href "https://www.cs.umd.edu/~bren"
                #:degree* `()
                #:gender 'F))

(define austin-bourgerie
  (make-student "Austin Bourgerie"
    #:title 'reu ;; maybe supported by "GT across the spectrum"
    #:university university-of-maryland
    #:mailto #f
    #:href "https://www.linkedin.com/in/bourg"
    #:degree* '()))

;; =============================================================================
;; Associates

(define amal-ahmed
  (make-person "Amal Ahmed"
    #:title "Assistant Professor"
    #:href "http://www.ccs.neu.edu/home/amal/"))

(define carl-friedrich-bolz-tereick
  (make-person "Carl-Friedrich Bolz-Tereick"
    #:title "Researcher"
    #:href "http://cfbolz.de/"))

(define emina-torlak
  (make-person "Emina Torlak"
    #:title "Assistant Professor"
    #:href "https://homes.cs.washington.edu/~emina/index.html"))

(define philip-wadler
  (make-person "Philip Wadler"
    #:title "Professor"
    #:href "http://homepages.inf.ed.ac.uk/wadler/"))

(define dustin-jamner
  (make-student "Dustin Jamner"
    #:title 'reu ;; not supported by "GT Across the Spectrum", I think
    #:university northeastern-university
    #:mailto #f
    #:href "https://github.com/DIJamner"
    #:degree* '()))

;; =============================================================================

(module+ test
  (require typed/rackunit rackunit-abbrevs/typed)

  (check-apply* person->adjective
   [max-new
    => "his"]
   [brianna-ren
    => "her"]
   [asumu-takikawa
    => "his"])
)
;; =============================================================================

;(module+ test
;  (require typed/rackunit rackunit-abbrevs/typed)
;
;  (check-equal? (for/list : (Listof Year)
;                          ([p (in-list (pi-position* jeremy-siek))])
;                  (position-year p))
;                '(2013 2006))
;
;  (check-equal? (for/list : (Listof Year)
;                          ([p (in-list (person-degree* jeremy-siek))])
;                  (degree-year p))
;                '(2005 2005 1999 1999))
;
;  (check-equal? (degree-year (car (person-degree* shriram-krishnamurthi))) 2001)
;  (check-equal? (position-year (car (pi-position* shriram-krishnamurthi))) 2000)
;  (check-equal? (university-name rice-university) "Rice University")
;
;  (check-equal? (for/list : (Listof Year)
;                          ([p (in-list (pi-position* jeremy-siek))])
;                  (position-year p))
;                '(2013 2006))
;
;  (check-equal? (for/list : (Listof Year)
;                          ([p (in-list (person-degree* jeremy-siek))])
;                  (degree-year p))
;                '(2005 2005 1999 1999))
;
;  (check-equal? (degree-year (car (person-degree* shriram-krishnamurthi))) 2001)
;  (check-equal? (position-year (car (pi-position* shriram-krishnamurthi))) 2000)
;
;  (check-equal? (person-full-name jan-vitek) "Jan Vitek")
;  (check-true (regexp-match? "Jeff Foster" (person->short-name jfoster)))
;  (check-true (regexp-match? "Jeffrey S. Foster" (person->full-name jfoster)))
;
;  (let ([h1 (pi->history matthias)]
;        [h2 (pi->history siek)])
;    (check-equal? (length h1) 3)
;    (check-equal? (length h2) 3)
;    (for ([h (in-list h1)]
;          [q (in-list '("Northeastern" "Rice" "Ph.D"))])
;      (check-true (regexp-match? q h)))
;    (for ([h (in-list h2)]
;          [q (in-list '("Indiana" "Colorado" "Indiana"))])
;      (check-true (regexp-match? q h))))
;
;)
