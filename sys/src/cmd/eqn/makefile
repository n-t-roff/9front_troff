_BINDIR =	${DWBHOME}/${BINDIR}

TARG =		eqn

OFILES =	eqn.o main.o tuning.o diacrit.o eqnbox.o font.o fromto.o \
		funny.o glob.o integral.o input.o lex.o lookup.o mark.o \
		matrix.o move.o over.o paren.o pile.o shift.o size.o \
		sqrt.o text.o

YFLAGS =	-d

all:		$(TARG)

clean:
		rm -f $(OFILES) $(TARG) eqn.c y.tab.?

install:
		@[ -d ${_BINDIR} ] || mkdir -p ${_BINDIR}
		install ${TARG} ${_BINDIR}/

uninstall:
		rm -f ${_BINDIR}/${TARG}
		@rmdir ${_BINDIR} 2> /dev/null || true

$(TARG):	eqn.c $(OFILES)
		$(CC) -o $@ $(OFILES)

eqn.c:		eqn.y
		$(YACC.y) eqn.y
		sed -f yyval.sed < y.tab.c > $@
