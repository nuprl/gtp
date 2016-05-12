gtp.github.io
===

Website for [Gradual Typing Across the Spectrum](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1518844).
Built using [Racket](https://racket-lang.org/) (especially [`#lang scribble/html`](http://docs.racket-lang.org/scribble-pp/html.html))
Designed by [Catchexception s.r.o.](http://www.catchexception.cz/)

- The `*.html` files are generated from the matching `*.rkt` files
- Run `make` to rebuild the site; `make clean` to destroy it
- Subfolders are for support:
  - `css` is stylesheets
  - `fonts` is fonts
  - `images` is all the images (banners, people, projects, widgets)
  - `js` is javascript
  - `pi2016` is a schedule for the meeting coming May 2016
  - `templates` is Racket code for storing and rendering data


FAQ
---

#### How do I change my photo?

Replace (or create) the file `images/people/YOUR-NAME` where `YOUR-NAME` is:
- your name
- in lowercase
- with all spaces replaced by hyphens (`-`)
- ending in `.png` or `.jpg` or `.jpeg` or whatever

For example, my name is "Ben Greenman" and my `YOUR-NAME` is `ben-greenman.png`.


#### How do I change my website?

Open `templates/people.rkt`. Find your name. Change your URL.


#### How do I change how my name is displayed?

Open `templates/people.rkt`. Find your name. Edit the string just after `make-student`.
Don't edit anything else and you should be great.


#### How do I add a person to the website?

1. Define a new person in `templates/people.rkt` using the `make-student` function
2. Add the person to the appropriate list near the bottom of `./people.rkt`
3. Put an image for the person in `images/people/`


#### Help! I typed `make` but my changes aren't showing up!

Edit the `.rkt` file for the page you want changed or delete the `.html` file.
(The `Makefile` tries to rebuild as little as possible, so if you change back-end code you need to push the front-end.)


#### How do I add a project to the `Research` page?

Add an `@project[]{...}` element to `research.rkt`.


#### How do I add a news/event/research item?

Open `index.rkt`. Find the list under `research-highlights` or under `news-and-events`.
Add your content under a `@div{...}` or `@p{...}` tag, or something fancier.


#### What are all these `@` symbols?

See [here](http://docs.racket-lang.org/scribble/reader.html).

