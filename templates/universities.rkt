#lang typed/racket/base

(provide (all-defined-out))

(require "datatypes.rkt")

;; =============================================================================

(define university-of-edinburgh
  (make-university "University of Edinburgh"
                   #:href "https://www.ed.ac.uk/"))

(define it-copenhagen
  (make-university "IT University of Copenhagen"
                   #:href "http://www.itu.dk/"))

(define harvard-university
  (make-university "Harvard University"
                   #:href "https://www.seas.harvard.edu/computer-science"))

(define princeton-university
  (make-university "Princeton University"
                   #:href "https://www.cs.princeton.edu/"))

(define wpi
  (make-university "WPI"
                   #:href "http://www.wpi.edu/academics/cs/"))

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

(define ucsd
  (make-university "University of San Diego"
                   #:href "https://cse.ucsd.edu/"))

(define university-of-washington
  (make-university "University of Washington"
                   #:href "https://www.cs.washington.edu/"))

(define helwan-university
  (make-university "Helwan University"
                   #:href "http://www.helwan.edu.eg"))

;; =============================================================================

(module+ test
  (require typed/rackunit)

  (check-equal? (university-name rice-university) "Rice University")
)
