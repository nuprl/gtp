#lang scribble/text
@require["templates.rkt"]

@; =============================================================================

@default-doctype[]
<html lang="en">
  @header[]
  <body id="@|body-id|">
    @nav["About"]
    <!-- Body -->
    <div class="body-content">
      <div id="content">
        <div class="col-md-12">
          <h2 class="red-back-big-big">Project Overview</h2>
          <div class="col-md-12 card" >
            <p>
              With the rise of the web, dynamically typed &mdash; often called
              <i>untyped</i> &mdash; programming languages have emerged as
              major development platforms.
              Untyped languages now make up around half of the top-ten languages
              named in developer positions posted on job listing sites such as
              Amazon, Slashdot, and SourceForge; they include JavaScript, PHP,
              Perl, Python, Ruby, Shell, SQL, and Visual Basic.
              Although these languages are dubbed <i>scripting languages</i>
              &mdash; implying small, possibly throw-away snippets of code &mdash;
              developers routinely use these languages to produce critical pieces
              of software infrastructure, including
              @make-href["https://secure.pensionsmyndigheten.se" "a country's"]
              @make-href["http://janvitek.org/talks/dls09.pdf" "entire pension system"],
              the software product of
              @make-href["https://blog.twitter.com/2011/twitter-search-is-now-3x-faster" "companies"]
              such as @make-href["http://www.zdnet.com/article/why-facebook-hasnt-ditched-php" "Facebook"],
              and @make-href["http://erlang.org/faq/introduction.html#idp3203003201" "more"].
              Among many reasons, developers @make-href["http://www.artima.com/scalazine/articles/twitter_on_scala.html" "cite"]
              the flexibility of untyped languages as they allow the rapid
              construction of robust and useful prototypes.
              When it comes to software maintenance, however, untyped languages
              are at a @make-href["http://programmers.stackexchange.com/questions/221615/why-do-dynamic-languages-make-it-more-difficult-to-maintain-large-codebases" "disadvantage"]
              For many maintenance tasks &mdash; debugging, adding features,
              closing security holes &mdash; programmers often manipulate code
              that they have never seen before or have not seen in a long time.
              Without type information, they need to mentally reconstruct
              the signatures of classes, methods, fields, and functions before
              they modify the code.
              Depending on the size and interconnectedness of the system,
              this reconstruction process adds a serious amount of work to any
              maintenance task.
            </p>
            <p>
              This project brings together a diverse set of researchers that
              maintain practical gradual typing systems including:
              @make-href["research.html#reticulated-python" "Reticulated Python"],
              @make-href["research.html#diamondback-ruby" "Diamondback Ruby"],
              @make-href["research.html#racket" "Typed Racket"],
              @make-href["research.html#pyret" "Pyret"],
              and an emerging gradual type system for the
              @make-href["research.html#R" "R"] language.
              The intention is to identify principles of gradual typing that
              hold across the spectrum.
            </p>
            <p>
              Significant open questions:
              <ul>
                <li>
                  <b>Full language integration:</b> None of the existing systems
                  cope with all the features that are found in modern programming
                  languages (e.g. reflection, concurrency, dynamic code generation).
                </li>
                <li>
                  <b>Efficient soundness:</b> Researchers have chosen different points
                  in the space between soundness (the type system makes
                  meaningful guarantees ahead of time) and performance
                  (integrations of typed and untyped components may
                  misinterpret bits and behave like C/C++).
                  These decisions have been made on an ad-hoc basis and call
                  for a thorough investigation.
                </li>
                <li>
                   <b>Empirical evaluation:</b> The design of gradually typed
                   languages must be informed by
                   @make-href["http://www.cmu.edu/teaching/assessment/howto/basics/formative-summative.html" "summative"]
                   evaluations of
                   gradual typing's feasibility and usefulness.
                   The former calls for studies of every single
                   path from untyped to a typed system; the latter calls for
                   user studies concerning productivity benefits.)
                </li>
              </ul>
            </p>
          </div>
        </div>
        <div class="col-md-12">
          <h3 class="red-back-big">@|PROJECT-NAME|</h3>
          <div class="col-md-12 card" >
            <p>
              <i>@|PROJECT-NAME|</i> is funded by the National Science Foundation
              (@make-href[AWARD-HREF AWARD-NUMBER]).
            </p>
            <p>
              <a href="people.html">Principal investigators</a> are
              @author*->string[(list
                 matthias
                 jan-vitek
                 sk
                 samth
                 siek
                 jfoster)].
            </p>
            <p>
              Participating universities are
              @university*->string[(list
                northeastern-university
                brown-university
                indiana-university
                university-of-maryland)].
            </p>
          </div>
        </div>
      </div>
      @sponsors[]
      @footer[]
  </body>
</html>
