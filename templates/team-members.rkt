#lang typed/racket/base

(provide (all-defined-out))

(require "datatypes.rkt" "universities.rkt")

;; =============================================================================

(define anon "a@a.a")

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
                #:title "Student"
                #:mailto anon
                #:university northeastern-university
                #:href "https://github.com/AlexKnauth"
                #:degree* '()))

(define zeina-migeed
  (make-student "Zeina Migeed"
                #:title "Student"
                #:university indiana-university
                #:mailto "abdelmigeed.z@husky.neu.edu"
                #:href "http://github.com/migeed-z"
                #:degree* '()))

(define justin-pombrio
  (make-student "Justin Pombrio"
                #:title 'phd
                #:university brown-university
                #:mailto "justinlpombrio@gmail.com"
                #:href "http://justinpombrio.net/"
                #:degree* `((bs ,wpi 2011))))

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
                #:title "Student"
                #:university brown-university
                #:href "https://github.com/mkolosick"
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

