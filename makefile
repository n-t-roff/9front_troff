TEMPDIR =	/var/tmp
DWBHOME =	/usr/local/9froff
BINDIR =	bin
LIBDIR =	lib
TMACDIR =	$(LIBDIR)/tmac
FONTDIR	=	$(LIBDIR)/troff/font
NTERMDIR =	$(LIBDIR)/troff/term
POSTDIR =	${LIBDIR}/postscript
MAN1DIR =	man/man1
MAN5DIR =	man/man5
ALTHYPHENS =	$(TMACDIR)/hyphen.tex
TEXHYPHENS =	/usr/share/texmf/tex/generic/hyphen/hyphen.tex
PROGRAMNAME =	troff, 9front edition
#CFLAGS =	-g
LDFLAGS =	-s

MKMACS =	TMACDIR=${TMACDIR} FONTDIR=${FONTDIR} NTERMDIR=${NTERMDIR} \
		TEXHYPHENS=${TEXHYPHENS} ALTHYPHENS=${ALTHYPHENS} \
		DWBHOME=${DWBHOME} BINDIR=${BINDIR} LIBDIR=${LIBDIR} \
		"CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" POSTDIR=${POSTDIR} \
		TEMPDIR=${TEMPDIR} MAN1DIR=$(MAN1DIR) MAN5DIR=$(MAN5DIR) \
		"PROGRAMNAME=$(PROGRAMNAME)"

SUBDIRS =	libcompat sys

all clean install uninstall:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		@if [ "$@" = "uninstall" -a -d ${DWBHOME} ]; then \
			find ${DWBHOME} -depth -type d -exec rmdir {} \
			    \;; \
		fi
