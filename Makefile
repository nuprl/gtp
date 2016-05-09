TARGETS=about.html index.html people.html research.html team.html

all: $(TARGETS)

%.html: %.rkt templates/*.html
	raco make -v $<
	if [ -f $@ ]; then chmod +w $@; fi
	racket -t $< > $@
	chmod -w $@

clean:
	rm -f $(TARGETS)
	rm -r compiled/

