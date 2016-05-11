#lang scribble/html

@(provide make-a)
@(require net/url)

@(define (make-a href text)
  (define str (if (url? href) (url->string href) href))
  @a[href: str text])
