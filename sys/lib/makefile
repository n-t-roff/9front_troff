_LIBDIR =	$(DWBHOME)/$(LIBDIR)

FILES =		eqnchar grap.defines postscript texmf tmac troff

all clean:

install:	uninstall
		@[ -d $(_LIBDIR) ] || mkdir -p $(_LIBDIR)
		@for i in $(FILES); do \
			cp -R $$i $(_LIBDIR)/; \
			find $(_LIBDIR)/$$i -type d -exec chmod 755 {} \;; \
			find $(_LIBDIR)/$$i -type f -exec chmod 644 {} \;; \
		done

uninstall:
		@for i in $(FILES); do \
			rm -rf $(_LIBDIR)/$$i || true; \
		done
		@rmdir $(_LIBDIR) 2> /dev/null || true
