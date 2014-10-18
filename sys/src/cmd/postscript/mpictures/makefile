_TMACDIR =	$(DWBHOME)/$(TMACDIR)

all:		pictures.sr

clean:

install:
		@[ -d $(_TMACDIR) ] || mkdir -p $(_TMACDIR)
		install -m 644 pictures.sr $(_TMACDIR)/tmac.pictures

uninstall:
		rm -f $(_TMACDIR)/tmac.pictures
		@rmdir $(_TMACDIR) 2> /dev/null || true
