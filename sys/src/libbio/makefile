_LIBDIR =	${DWBHOME}/${LIBDIR}

LIB =		libbio.so
LIBV =		$(LIB).1
LIBVV =		$(LIBV).0.1

OFILES =	bbuffered.o bfildes.o bflush.o bgetrune.o bgetc.o bgetd.o \
		binit.o blethal.o boffset.o bprint.o bputrune.o bputc.o \
		brdline.o brdstr.o bread.o bseek.o bwrite.o bvprint.o

CPPFLAGS =	-I../../include

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
		ln -s ${LIBVV} ${LIBV}
		ln -s ${LIBV} ${LIB}

.c.o:
		${CC} -fPIC ${CFLAGS} ${CPPFLAGS} -c $<
