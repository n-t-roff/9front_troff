LIB =		libc_port.a

OFILES =	rune.o getfields.o getcallerpc.o nan.o pow10.o utfecpy.o \
		utfrune.o charstod.o utflen.o

CPPFLAGS =	-I../../../include

all:		${LIB}

clean:
		rm -f ${OFILES} ${LIB}

install uninstall:

${LIB}:		${OFILES}
		ar cr $@ ${OFILES}
		ranlib $@

.c.o:
		${CC} -fPIC ${CFLAGS} ${CPPFLAGS} -c $<
