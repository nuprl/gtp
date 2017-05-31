TARGETS=about.html contact.html index.html people.html research.html

all: setup $(TARGETS)

setup:
	raco pkg install --auto --skip-installed rackunit-abbrevs

%.html: %.rkt
	raco make -v $<
	if [ -f $@ ]; then chmod +w $@; fi
	racket -t $< > $@
	chmod -w $@

clean:
	rm -f $(TARGETS)
	rm -r compiled/

