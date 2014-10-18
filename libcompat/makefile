_LIBDIR =	${DWBHOME}/${LIBDIR}

LIB =		libcompat.so
LIBV =		${LIB}.1
LIBVV =		${LIBV}.0.1

OFILES =	seek.o USED.o argv0.o exits.o create.o errstr.o \
		setmalloctag.o mallocz.o

CPPFLAGS =	-I../src/include

all:		${LIBVV}

clean:
		rm -f ${OFILES} ${LIB}*

install:
		@[ -d ${_LIBDIR} ] || mkdir -p ${_LIBDIR}
		install ${LIBVV} ${_LIBDIR}/
		@cd ${_LIBDIR}; \
		rm -f ${LIB} ${LIBV}; \
		ln -s ${LIBVV} ${LIBV}; \
		ln -s ${LIBV} ${LIB}

uninstall:
		rm -f ${_LIBDIR}/${LIB}*
		@rmdir ${_LIBDIR} 2> /dev/null || true

${LIBVV}:	${OFILES}
		${CC} -shared -Wl,-soname,${LIBV} -o $@ ${OFILES}
		rm -f ${LIB} ${LIBV}
		ln -s $@ ${LIBV}
		ln -s ${LIBV} ${LIB}

.c.o:
		${CC} -fPIC ${CFLAGS} ${CPPFLAGS} -c $<
