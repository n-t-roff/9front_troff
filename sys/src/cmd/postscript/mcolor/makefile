_TMACDIR =	$(DWBHOME)/$(TMACDIR)
_MAN5DIR =	$(DWBHOME)/$(MAN5DIR)

all:		color.sr mcolor.5.man

clean:

install:
		@[ -d $(_TMACDIR) ] || mkdir -p $(_TMACDIR)
		install -m 644 color.sr $(_TMACDIR)/tmac.color
		@[ -d $(_MAN5DIR) ] || mkdir -p $(_MAN5DIR)
		install -m 644 mcolor.5.man $(_MAN5DIR)/mcolor.5

uninstall:
		rm -f $(_TMACDIR)/tmac.color
		@rmdir $(_TMACDIR) 2> /dev/null || true
		rm -f $(_MAN5DIR)/mcolor.5
		@rmdir $(_MAN5DIR) 2> /dev/null || true
