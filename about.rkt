#lang scribble/html
@require["templates.rkt"]


@; =============================================================================

@page[1]{
  @div[class: "col-md-12"]{
    @h3[class: "red-back-big-big"]{Project Overview}
    @div[class: "col-md-12 card"]{
      @p{
        With the rise of the web, dynamically typed @|---| often called
        @i{untyped} @|---| programming languages have emerged as
        major development platforms.
        Untyped languages now make up around half of the top-ten languages
        named in developer positions posted on job listing sites such as
        Amazon, Slashdot, and SourceForge; they include JavaScript, PHP,
        Perl, Python, Ruby, Shell, SQL, and Visual Basic.
        Although these languages are dubbed @i{scripting languages}
        @|---| implying small, possibly throw-away snippets of code @|---|
        developers routinely use these languages to produce critical pieces
        of software infrastructure, including
        @a[href: "https://secure.pensionsmyndigheten.se"]{a country's}
        @a[href: "http://janvitek.org/talks/dls09.pdf"]{entire pension system},
        the software product of
        @a[href: "https://blog.twitter.com/2011/twitter-search-is-now-3x-faster"]{companie}s
        such as @a[href: "http://www.zdnet.com/article/why-facebook-hasnt-ditched-php"]{Facebook},
        and @a[href: "http://erlang.org/faq/introduction.html#idp3203003201"]{more}.
        Among many reasons, developers @a[href: "http://www.artima.com/scalazine/articles/twitter_on_scala.html"]{cite}
        the flexibility of untyped languages as they allow the rapid
        construction of robust and useful prototypes.
        When it comes to software maintenance, however, untyped languages
        are at a @a[href: "http://programmers.stackexchange.com/questions/221615/why-do-dynamic-languages-make-it-more-difficult-to-maintain-large-codebases"]{disadvantage}
        For many maintenance tasks @|---| debugging, adding features,
        closing security holes @|---| programmers often manipulate code
        that they have never seen before or have not seen in a long time.
        Without type information, they need to mentally reconstruct
        the signatures of classes, methods, fields, and functions before
        they modify the code.
        Depending on the size and interconnectedness of the system,
        this reconstruction process adds a serious amount of work to any
        maintenance task.
      }@p{
        This project brings together a diverse set of researchers that
        maintain practical gradual typing systems including:
        @a[href: "research.html#reticulated-python"]{Reticulated Python},
        @a[href: "research.html#diamondback-ruby"]{Diamondback Ruby},
        @a[href: "research.html#racket"]{Typed Racket},
        @a[href: "research.html#pyret"]{Pyret},
        @a[href: "research.html#typed-clojure"]{Typed Clojure},
        and an emerging gradual type system for the
        R language.
        The intention is to identify principles of gradual typing that
        hold across the spectrum.
      }@p{
        Significant open questions:
        @ul{
          @li{
            @b{Full language integration:} None of the existing systems
            cope with all the features that are found in modern programming
            languages (e.g. reflection, dynamic code generation).
          }@li{
            @b{Efficient soundness:} Researchers have chosen different points
            in the space between soundness (the type system makes
            meaningful guarantees ahead of time) and performance
            (integrations of typed and untyped components may
            misinterpret bits and behave like C/C++).
            These decisions have been made on an ad-hoc basis and call
            for a thorough investigation.
          }@li{
             @b{Empirical evaluation:} The design of gradually typed
             languages must be informed by
             @a[href: "http://www.cmu.edu/teaching/assessment/howto/basics/formative-summative.html"]{summative}
             evaluations of
             gradual typing's feasibility and usefulness.
             The former calls for studies of every single
             path from untyped to a typed system; the latter calls for
             user studies concerning productivity benefits.)
  }}}}}
  @div[class: "col-md-12"]{
    @h3[class: "red-back-big" PROJECT-NAME]
    @div[class: "col-md-12 card"]{
      @p{
        @i[PROJECT-NAME] is funded by the National Science Foundation
        (@a[href: AWARD-HREF AWARD-NUMBER]).
      }@p{
        Principal investigators are
        @author*->string[(list
           matthias
           jan-vitek
           sk
           samth
           siek
           jfoster)].
      }@p{
        Participating universities are
        @university*->string[(list
          northeastern-university
          brown-university
          indiana-university
          university-of-maryland)].
}}}}
