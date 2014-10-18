OFILES =	common.o
#		bbox.o glob.o misc.o request.o tempnam.o getopt.o

CPPFLAGS =	-I../../../../include -D'TEMPDIR="$(TEMPDIR)"' \
		-D'POSTDIR="$(DWBHOME)/$(POSTDIR)"'


all:		$(OFILES)

clean:
		rm -f $(OFILES)

install uninstall:
