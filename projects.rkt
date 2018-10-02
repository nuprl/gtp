#lang scribble/html
@require["templates.rkt"]


@(define (research-projects . p*)
  @(list
     @h3[class: "red-back-big"]{Projects}
     @(map project->string p*)))

@(define (project #:name name #:href href desc)
   (list name href desc))

@(define project-name car)
@(define project-href cadr)
@(define project-description caddr)

@(define (project->id p)
   (string->id (project-name p)))

@(define (project->string p)
   (define id (project->id p))
   (define href (project-href p))
   @div[class: "col-md-12"]{
     @h3[id: id class: "gray-back"]{@project-name[p]}
     @div[class: "col-md-12 card"]{
       @img[class: "img-responsive project-logo"
            src: (format "images/projects/~a.png" id)]
       @project-description[p]
       @div[class: "row col-md-12"]{
         @span[class: "pull-right"]{
           You can find more on this site:
           @a[href: href
              class: "project-link"
              target: "_blank"
              href]}}}})

@; =============================================================================

@page[2]{
  @research-projects[
    @project[
      #:name "Reticulated Python"
      #:href "https://github.com/mvitousek/reticulated"
    @(list @p{
        Reticulated Python adds optional static and runtime typechecking
        to @a[href: "https://www.python.org"]{Python}.
        It lets programmers annotate functions and classes with types,
        and it enforces these types both before and during the execution
        of the program, providing early detection of errors.
        Crucially, Reticulated does not require that all parts of a
        program be given static types, or even any of it.
        In places where typed and untyped code interact @|---|
        for example, when an untyped variable is passed into a function
        whose argument type is @tt{Int} @|---| Reticulated can
        perform runtime checks ensure that the values in variables
        always correspond to their expected types, even when this
        cannot be guaranteed statically.
      }@p{
        Reticulated Python runs on both
        @a[href: "https://docs.python.org/3"]{Python 3} and
        @a[href: "https://docs.python.org/3"]{Python 2.7},
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
        type @tt{List(Dyn)}.
      }@p{
        Reticulated Python itself is written in Python
        (specifically, the subset of Python that is syntactically
        compatible with both Python 2.7 and 3).
        Its static, compile-time component is both a "linter" or
        static analyzer, and a source-to-source translator.
        This component parses source files (using the Python
        @a[href: "https://docs.python.org/3/library/ast.html"]{ast} package)
        and searches for type errors, rejecting programs that have
        statically detectable errors and syntactically inserting
        runtime checks or casts at boundaries between typed and
        untyped code, where type errors may occur.
    })]
    @project[
      #:name "Diamondback Ruby"
      #:href "http://www.cs.umd.edu/projects/PL/druby/"
      @(list @p{
        Diamondback Ruby (DRuby) is an extension to
        @a[href: "https://www.ruby-lang.org"]{Ruby} that aims to
        bring the benefits of static typing to Ruby without
        compromising the expressiveness of the language.
        The main features of DRuby are:
      }
      @ul[class: "research-ul"]{
        @li{
          Type inference: DRuby uses inference to model most of Ruby’s
          idioms as precisely as possible without any need for programmer
          intervention.
        }@li{
          Type annotations: Methods may be given explicit type
          annotations with an @a[href: "http://docs.seattlerb.org/rdoc/"]{RDoc}-inspired syntax.
        }@li{
          Dynamic checking: When necessary, methods can be type checked
          at runtime, using contracts to isolate and properly blame any
          errant code, similar to gradual typing.
        }@li{
          Metaprogramming support: DRuby includes a combined static
          and dynamic analysis to precisely model dynamic meta-programming
          constructs, such as @tt{eval} and @tt{method_missing}.
      }})]
    @project[
      #:name "Typed Racket"
      #:href "https://docs.racket-lang.org/ts-guide/"
    @(list
      @p{
        Typed Racket is a sister language of
        @a[href: "http://racket-lang.org"]{Racket}
        with statically-checked type annotations.
        Racket and Typed Racket programs are fully interoperable:
        any typed functions may be used freely in untyped code and
        any untyped functions may be imported to typed code by supplying
        a type annotation.
        Type soundness is enforced despite these interactions by interpreting
        types as @a[href: "https://www.eecs.northwestern.edu/~robby/pubs/papers/ho-contracts-icfp2002.pdf"]{higher-order contracts}
        and dynamically enforcing type-correct use.
      }@p{
        To accomodate the flow-sensitive reasoning commonly used in
        untyped programs, Typed Racket employs
        @a[href: "http://www.ccs.neu.edu/racket/pubs/icfp10-thf.pdf"]{occurrence-typing}:
        a technique for refining the type of variables based on predicates
        prior to each occurrence of the variable in the control flow graph.
        Typed Racket is also macro-extensible and includes types for
        @a[href: "http://www.ccs.neu.edu/racket/pubs/esop09-sthf.pdf"]{variable-arity, polymorphic functions};
        @a[href: "http://www.ccs.neu.edu/racket/pubs/esop13-tsth.pdf"]{continuations}; and
        @a[href: "http://www.ccs.neu.edu/racket/pubs/ecoop2015-takikawa-et-al.pdf"]{first-class classes}.
    })]
    @project[
      #:name "Pyret"
      #:href "https://www.pyret.org/"
    @(list
      @p{
        Pyret is a programming language designed to serve as an
        outstanding choice for programming education while exploring
        the confluence of scripting and functional programming.
        It's under active design and development, and free to use or modify.
      }
      @ul[class: "research-ul"]{
        @li{
          Pyret has Python-inspired syntax for functions, lists,
          and operators.
          Iteration constructs are designed to be evocative of
          those in other languages.
        }@li{
          Pyret makes testing a natural part of the programming
          process.
          Functions can end in a @tt{where:} clause that
          holds unit tests for the function.
          These assertions are checked dynamically.
        }@li{
          Pyret allows concise, expressive, recursive data declarations.
          Type annotations are optional and can be added incrementally,
          to serve a variety of pedagogic styles and curricular needs.
      }}
    )]
    @project[
      #:name "Pycket"
      #:href "http://www.github.com/pycket/pycket"
      @p{
        Pycket is a high-performance tracing JIT compiler for Racket.
        Pycket supports a wide variety of the sophisticated features
        in Racket such as contracts, continuations, classes, structures,
        and dynamic binding.
        Compiling standard Typed Racket code through Pycket can
        @a[href: "http://www.ccs.neu.edu/home/samth/pycket-draft.pdf"]{significantly reduce} the performance overhead of
        sound gradual typing.
      }]
    @project[
      #:name "Typed Clojure"
      #:href "http://typedclojure.org"
      @p{
        Typed Clojure is an optional type system for 
        @a[href: "http://clojure.org/"]{Clojure}. It understands
        common idioms used by Clojure programmers like multimethods, local
        control flow, Java interoperability, and heterogeneous maps.
        It is a 
        @a[href: "http://frenchy64.github.io/papers/esop16-short.pdf"]{practical system} used in industry and open source.
        }]
    @project[
      #:name "Grift"
      #:href "https://github.com/Gradual-Typing/Grift"
    @(list @p{
            Grift is a gradually-typed language that was designed and implemented
            from scratch. In practice, most gradually-typed languages currently
            used in practice are designed by adding static typing to an existing
            language, e.g. Typed Racket for Racket, TypeScript and SafeTypeScript
            for JavaScript, Hack for PHP, Reticulated Python for Python, etc.
            However, adding static typing in a way that satisfies a strong notion
            of type soundness requires additions/modifications to the runtime
            system to do type checking when necessary at runtime. This is usually
            a source of performance inefficiency. For instance, Typed Racket used
            Racket's runtime contract system without modifications to maintain
            type soundness and it caused up to 100x slowdown as reported in their
            POPL 2016 paper. In Grift's compiler, the runtime system is completely
            designed with the goal to minimize the overhead of runtime checking
            for the gradually-typed language it implements.
      }@p{
        The compiler implements a variant of space-efficient coercions and
        space-efficient monotonic heap. Space-efficiency requires more work
        to be done when casting an already casted value at runtime which is
        typically some sort of composition/merging between the old and the new
        casts. On the other hand, it is much cheaper to access an already casted
        value because it is guaranteed to go through a single layer of checks
        instead of a chain of casts that is linear in the number of times this
        value has been casted before. Grift's runtime also represents values
        and types in a way that makes many operations on them that are related
        to runtime checking very efficient. Our self-comparison performance
        evaluation indicates that this approach increased performance
        substantially in comparison to our own implementation of the
        space-inefficient runtime. It also indicates that the overhead of doing
        composition/merging is not expensive. Furthermore, fully typed and fully
        untyped code is in the ball-park of OCaml, and Typed Racket, and of Chez
        Scheme, Gambit Scheme, and Racket respectively.
      })]
    @;@project[
    @;  #:name "R"
    @;  #:href "http://janvitek.org"
    @;  @p{Coming soon!}
    @;]
  ]}
