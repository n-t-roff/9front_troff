_BINDIR =	${DWBHOME}/${BINDIR}
_LIBDIR =	${DWBHOME}/${LIBDIR}
PKGROOT =	../../..

MKMACS =	TMACDIR=${TMACDIR} FONTDIR=${FONTDIR} NTERMDIR=${NTERMDIR} \
		TEXHYPHENS=${TEXHYPHENS} ALTHYPHENS=${ALTHYPHENS} \
		DWBHOME=${DWBHOME} BINDIR=${BINDIR} LIBDIR=${LIBDIR} \
		"CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" POSTDIR=${POSTDIR} \
		TEMPDIR=${TEMPDIR} MAN1DIR=$(MAN1DIR) MAN5DIR=$(MAN5DIR) \
		"PROGRAMNAME=$(PROGRAMNAME)"

SUBDIRS =	postscript troff tbl eqn pic grap

CPPFLAGS =	-I${PKGROOT}/sys/include

_LDFLAGS =	-L${PKGROOT}/libcompat      -lcompat \
		-L${PKGROOT}/sys/src/libc   -lc_p9   \
		-L${PKGROOT}/sys/src/libbio -lbio    \
		-L${_LIBDIR} -Wl,-rpath,${_LIBDIR}

all:		col
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done

clean:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		rm -f col.o col

install:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		@[ -d ${_BINDIR} ] || mkdir -p ${_BINDIR}
		install col ${_BINDIR}/

uninstall:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		rm -f ${_BINDIR}/col
		@rmdir ${_BINDIR} 2> /dev/null || true

col:		col.o
		$(CC) -o $@ col.o ${_LDFLAGS}
