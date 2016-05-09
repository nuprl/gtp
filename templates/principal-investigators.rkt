#lang typed/racket/base

(provide
  matthias-felleisen
  jan-vitek
  sam-tobin-hochstadt
  shriram-krishnamurthi
  jeff-foster
  jeremy-siek
  (rename-out
    (matthias-felleisen matthias)
    (jan-vitek jan)
    (sam-tobin-hochstadt samth)
    (shriram-krishnamurthi sk)
    (jeff-foster jfoster)
    (jeremy-siek siek)))

(require "datatypes.rkt" "universities.rkt")

;; =============================================================================

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
