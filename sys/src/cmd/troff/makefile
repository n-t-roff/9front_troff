TMACDIR =	sys/lib/tmac
FONTDIR	=	sys/lib/troff/font
NTERMDIR =	sys/lib/troff/term
TEXHYPHENS =	/sys/lib/texmf/tex/generic/hyphen/hyphen.tex
DWBHOME =	/
TDEVNAME =	utf
NDEVNAME =	utf
_BINDIR =	${DWBHOME}/${BINDIR}

TARG =		troff

OFILES =	n1.o n2.o n3.o n4.o n5.o t6.o n6.o n7.o n8.o n9.o t10.o \
		n10.o t11.o ni.o hytab.o suftab.o dwbinit.o

HFILES =	tdef.h fns.h ext.h dwbinit.h

CPPFLAGS =	-DSTRICT -DUNICODE \
		-DTMACDIR='"$(TMACDIR)"' -DTDEVNAME='"$(TDEVNAME)"' \
		-DFONTDIR='"$(FONTDIR)"' -DNTERMDIR='"$(NTERMDIR)"' \
		-DTEXHYPHENS='"$(TEXHYPHENS)"' -DNDEVNAME='"$(NDEVNAME)"' \
		-DALTHYPHENS='"$(ALTHYPHENS)"' -DDWBHOME='"$(DWBHOME)"'

all:		$(TARG)

clean:
		rm -f $(OFILES) $(TARG)

install:
		@[ -d ${_BINDIR} ] || mkdir -p ${_BINDIR}
		install ${TARG} ${_BINDIR}/
		@cd ${_BINDIR}; \
		rm -f nroff; \
		ln -s ${TARG} nroff

uninstall:
		rm -f ${_BINDIR}/${TARG}
		rm -f ${_BINDIR}/nroff
		@rmdir ${_BINDIR} 2> /dev/null || true

$(TARG):	$(OFILES)
		$(CC) -o $@ $(OFILES)
