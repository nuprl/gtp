#lang racket/base

;; Provides HTML templates and common variables for pages

(provide
  PROJECT-NAME
  ;; TODO

  body-id
  ;; TODO

  header footer nav sponsors
  ;; TODO

  (all-from-out "templates/datatypes.rkt")
  ;; Hyperlinked names
)

(require
  web-server/templates
  "templates/datatypes.rkt"
)

;; =============================================================================

(define PROJECT-NAME "Gradual Typing Across the Spectrum")
(define body-id "MyPage")

;; -----------------------------------------------------------------------------
;; --- Header/Footer

(define (sponsors [sponsors-text ""])
  (include-template "templates/sponsors.html"))

(define (header [title PROJECT-NAME])
  (include-template "templates/header.html"))

(define (footer)
  (include-template "templates/footer.html"))

(define (nav)
  (include-template "templates/nav.html"))

