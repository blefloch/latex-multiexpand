TESTFILE = multiexpand-example
TESTFILETMP = $(TESTFILE).aux $(TESTFILE).mtc* $(TESTFILE).maf $(TESTFILE).mw $(TESTFILE).lo* $(TESTFILE).toc
TMPDIR = tmp.multiexpand

package:
	pdflatex multiexpand.dtx

documentation: package
	pdflatex multiexpand.dtx
	pdflatex multiexpand.dtx

testfile:
	pdflatex multiexpand-example.tex

tds: package documentation
	rm -rf $(TMPDIR)
	mkdir -p $(TMPDIR)/tex/latex/multiexpand
	mkdir -p $(TMPDIR)/doc/latex/multiexpand
	mkdir -p $(TMPDIR)/source/latex/multiexpand
	cp README $(TMPDIR)/doc/latex/multiexpand/
	cp multiexpand.ins $(TMPDIR)/source/latex/multiexpand/
	cp multiexpand.dtx $(TMPDIR)/source/latex/multiexpand/
	cp multiexpand.pdf $(TMPDIR)/doc/latex/multiexpand/
	cp multiexpand.sty $(TMPDIR)/tex/latex/multiexpand/
	(cd $(TMPDIR) && zip -9r ../multiexpand.tds.zip *)

all: package documentation testfile tds clean

clean:
	@echo \
"The next command will probably produce an error, because it will try to\n\
delete non-existent files. This is not a problem."
	-rm multiexpand.aux multiexpand*.cmds multiexpand*.cpt multiexpand.dvi \
	  multiexpand.glo multiexpand.gls multiexpand.hd multiexpand.idv \
	  multiexpand.idx multiexpand.ilg multiexpand.ind multiexpand.lg \
	  multiexpand.log multiexpand.mw multiexpand.out multiexpand.tmp \
	  multiexpand.toc multiexpand.xref multiexpand.4ct multiexpand.4tc \
	  > /dev/null 2>&1
	-rm $(TESTFILETMP) > /dev/null 2>&1
	-rm -rf $(TMPDIR)
	-rm multiexpand.ins