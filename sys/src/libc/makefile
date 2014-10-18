_LIBDIR =	${DWBHOME}/${LIBDIR}

SUBLIBS =	9sys/libc_9sys.a fmt/libc_fmt.a port/libc_port.a

LIB =		libc_p9.so
LIBV =		${LIB}.1
LIBVV =		${LIBV}.0.1

MKMACS =	TMACDIR=${TMACDIR} FONTDIR=${FONTDIR} NTERMDIR=${NTERMDIR} \
		TEXHYPHENS=${TEXHYPHENS} ALTHYPHENS=${ALTHYPHENS} \
		DWBHOME=${DWBHOME} BINDIR=${BINDIR} LIBDIR=${LIBDIR} \
		"CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" POSTDIR=${POSTDIR} \
		TEMPDIR=${TEMPDIR} MAN1DIR=$(MAN1DIR) MAN5DIR=$(MAN5DIR) \
		"PROGRAMNAME=$(PROGRAMNAME)"

SUBDIRS =	9sys fmt port

all:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		$(MAKE) ${LIBVV}

${LIBVV}:	${SUBLIBS}
		${CC} -shared -Wl,-soname,${LIBV} -o ${LIBVV} \
		    -Wl,--whole-archive ${SUBLIBS} -Wl,--no-whole-archive
		rm -f ${LIB} ${LIBV}
		ln -s ${LIBVV} ${LIBV}
		ln -s ${LIBV} ${LIB}

clean:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		rm -f ${LIB}*

install:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		@[ -d ${_LIBDIR} ] || mkdir -p ${_LIBDIR}
		install ${LIBVV} ${_LIBDIR}/
		@cd ${_LIBDIR}; \
		rm -f ${LIB} ${LIBV}; \
		ln -s ${LIBVV} ${LIBV}; \
		ln -s ${LIBV} ${LIB}

uninstall:
		@for i in ${SUBDIRS}; do \
			(cd $$i; make $@ ${MKMACS}) || exit; \
		done
		rm -f ${_LIBDIR}/${LIB}*
		@rmdir ${_LIBDIR} 2> /dev/null || true
