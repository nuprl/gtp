#lang info

;; Metadata to define the GTP website as a Racket package.
;; (Makes it easy to manage dependencies)

(define collection "gtp.github.io")
(define deps '("base" "typed-racket-lib" "glob"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib" "rackunit-abbrevs"))
(define pkg-desc "Website for 'Gradual Typing Across the Spectrum (SHF 1518844)")
(define version "0")
(define pkg-authors '(ben))
