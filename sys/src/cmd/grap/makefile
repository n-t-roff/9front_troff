_BINDIR =	${DWBHOME}/${BINDIR}
_LIBDIR =	${DWBHOME}/${LIBDIR}

TARG =		grap

OFILES =	grap.o grapl.o main.o input.o print.o frame.o for.o \
		coord.o ticks.o plot.o label.o misc.o

YFLAGS =	-d
CPPFLAGS =	-D'LIBDIR="$(_LIBDIR)"'

all:		$(TARG)

clean:
		rm -f $(TARG) $(OFILES) y.tab.h

install:
		@[ -d ${_BINDIR} ] || mkdir -p ${_BINDIR}
		install ${TARG} ${_BINDIR}/

uninstall:
		rm -f ${_BINDIR}/${TARG}
		@rmdir ${_BINDIR} 2> /dev/null || true

$(TARG):	$(OFILES)
		$(CC) -o $(TARG) $(OFILES) -lm
