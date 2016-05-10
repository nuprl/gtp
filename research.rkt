#lang scribble/text
@require["templates.rkt" racket/string]


@(define (research-projects . p*)
   (string-append
     "<div id=\"content\" class=\"research\">\n"
     "<h2 class=\"red-back-big\">Projects</h2>"
     (string-join (map project->string p*) "\n")
     "</div>\n"))

@(define (project #:name name #:href href . desc*)
   (list name href (string-join desc*)))

@(define project-name car)
@(define project-href cadr)
@(define project-description caddr)

@(define (project->id p)
   (string->id (project-name p)))

@(define (project->string p)
   (define id (project->id p))
   (define href (project-href p))
   (string-append
     "<div class=\"col-md-12\">\n"
     "  <h3 id=\"" id "\" class=\"gray-back\">"
        (project-name p)
     "  </h3>\n"
     "  <div class=\"col-md-12 card\">\n"
     "    <img class=\"img-responsive project-logo\" src=images/projects/" id ".png />\n"
          (project-description p)
     "    <div class=\"row col-md-12\">\n"
     "      <span class=\"pull-right\">You can find more on this site: "
            (make-href href href #:other "class=\"project-link\" target=\"_blank\"")
     "      </span>\n"
     "    </div>\n"
     "  </div>\n"
     "</div>\n"))

@; =============================================================================

@default-doctype[]
<html lang="en">
  @header[]
  <body id="@|body-id|">
    @nav["Research"]
    <!-- Body -->
    <div class="body-content">
      @research-projects[
        @project[
          #:name "Reticulated Python"
          #:href "https://github.com/mvitousek/reticulated"
        ]{
          <p>
            Reticulated Python adds optional static and runtime typechecking
            to @make-href["https://www.python.org" "Python"].
            It lets programmers annotate functions and classes with types,
            and it enforces these types both before and during the execution
            of the program, providing early detection of errors.
            Crucially, Reticulated does not require that all parts of a
            program be given static types, or even any of it.
            In places where typed and untyped code interact &mdash;
            for example, when an untyped variable is passed into a function
            whose argument type is <tt>Int</tt> &mdash; Reticulated can
            perform runtime checks ensure that the values in variables
            always correspond to their expected types, even when this
            cannot be guaranteed statically.
          </p>
          <p>
            Reticulated Python runs on both
            @make-href["https://docs.python.org/3" "Python 3"] and
            @make-href["https://docs.python.org/3" "Python 2.7"],
            although the type annotation syntax is different between the two versions.
            Reticulated on Python 3 uses the syntactic annotations provided
            by Python 3 as type annotations, while Reticulated on Python 2.7
            uses decorators to specify types.
            In both cases, the absence of an annotation implies that the
            parameters or return values are dynamically typed, as in
            standard Python.
            We also provide "type functions" for creating types that
            correspond to higher-order values in Python, like functions
            and lists, and we provide the type <tt>Dyn</tt> (for dynamic) to
            allow for, for example, heterogeneous lists, which have the
            type <tt>List(Dyn)</tt>.
          </p>
          <p>
            Reticulated Python itself is written in Python
            (specifically, the subset of Python that is syntactically
            compatible with both Python 2.7 and 3).
            Its static, compile-time component is both a "linter" or
            static analyzer, and a source-to-source translator.
            This component parses source files (using the Python
            @make-href["https://docs.python.org/3/library/ast.html" "ast"] package)
            and searches for type errors, rejecting programs that have
            statically detectable errors and syntactically inserting
            runtime checks or casts at boundaries between typed and
            untyped code, where type errors may occur.
          </p>
        }
        @project[
          #:name "Diamondback Ruby"
          #:href "http://www.cs.umd.edu/projects/PL/druby/"
        ]{
          <p>
            Diamondback Ruby (DRuby) is an extension to
            @make-href["https://www.ruby-lang.org" "Ruby"] that aims to
            bring the benefits of static typing to Ruby without
            compromising the expressiveness of the language.
            The main features of DRuby are:
          </p>
          <ul class="research-ul">
            <li>
              Type inference: DRuby uses inference to model most of Ruby’s
              idioms as precisely as possible without any need for programmer
              intervention.
            </li>
            <li>
              Type annotations: Methods may be given explicit type
              annotations with an @make-href["http://docs.seattlerb.org/rdoc/" "RDoc"]-inspired syntax.
            </li>
            <li>
              Dynamic checking: When necessary, methods can be type checked
              at runtime, using contracts to isolate and properly blame any
              errant code, similar to gradual typing.
            </li>
            <li>
              Metaprogramming support: DRuby includes a combined static
              and dynamic analysis to precisely model dynamic meta-programming
              constructs, such as <tt>eval</tt> and <tt>method_missing</tt>.
            </li>
          </ul>
        }
        @project[
          #:name "Typed Racket"
          #:href "https://docs.racket-lang.org/ts-guide/"
        ]{
          <p>
            Typed Racket is a sister language of
            @make-href["http://racket-lang.org" "Racket"]
            with statically-checked type annotations.
            Racket and Typed Racket programs are fully interoperable:
            any typed functions may be used freely in untyped code and
            any untyped functions may be imported to typed code by supplying
            a type annotation.
            Type soundness is enforced despite these interactions by interpreting
            types as @make-href["https://www.eecs.northwestern.edu/~robby/pubs/papers/ho-contracts-icfp2002.pdf" "higher-order contracts"]
            and dynamically enforcing type-correct use.
          </p>
          <p>
            To accomodate the flow-sensitive reasoning commonly used in
            untyped programs, Typed Racket employs
            @make-href["http://www.ccs.neu.edu/racket/pubs/icfp10-thf.pdf" "occurrence-typing:"]
            a technique for refining the type of variables based on predicates
            prior to each occurrence of the variable in the control flow graph.
            Typed Racket is also macro-extensible and includes types for
            @make-href["http://www.ccs.neu.edu/racket/pubs/esop09-sthf.pdf" "variable-arity, polymorphic functions;"]
            @make-href["http://www.ccs.neu.edu/racket/pubs/esop13-tsth.pdf" "continuations;"] and
            @make-href["http://www.ccs.neu.edu/racket/pubs/ecoop2015-takikawa-et-al.pdf" "first-class classes."]
          </p>
        }
        @project[
          #:name "Pyret"
          #:href "https://www.pyret.org/"
        ]{
          <p>
            Pyret is a programming language designed to serve as an
            outstanding choice for programming education while exploring
            the confluence of scripting and functional programming.
            It's under active design and development, and free to use or modify.
          </p>
          <ul class="research-ul">
            <li>
              Pyret has Python-inspired syntax for functions, lists,
              and operators.
              Iteration constructs are designed to be evocative of
              those in other languages.
            </li>
            <li>
              Pyret makes testing a natural part of the programming
              process.
              Functions can end in a <tt>where:</tt> clause that
              holds unit tests for the function.
              These assertions are checked dynamically.
            </li>
            <li>
              Pyret allows concise, expressive, recursive data declarations.
              Type annotations are optional and can be added incrementally,
              to serve a variety of pedagogic styles and curricular needs.
            </li>
          </ul>
        }
        @project[
          #:name "R"
          #:href "http://janvitek.org"
        ]{
          <p>Coming soon!</p>
        }
      ]
      @sponsors[]
      @footer[]
    </div>
  </body>
</html>
