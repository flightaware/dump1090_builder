prefix = /usr
orig_prefix=/usr
libdir=$(prefix)/lib
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1

cwd=$$(pwd)
src=$(cwd)$(orig_prefix)
lib=$(src)/lib
dbin=$(src)/bin
docsrc=$(src)/share/man/man1
tclsh=tclsh8.5

htmlsrc=$(src)/share/dump1090/public_html
htmldest = $(sharedir)/dump1090/public_html
htmllongpath = $(htmldest)/coolclock

all: install

install: 
	@echo "DESTDIR is $(DESTDIR)"
	@echo ""
	install -d $(DESTDIR)$(bindir)
	install -d $(DESTDIR)$(libdir)
	install -d $(DESTDIR)/etc/init.d
	install -d $(DESTDIR)$(man1dir)
	install -d $(DESTDIR)$(htmllongpath)

	install -t $(DESTDIR)$(bindir) $(dbin)/dump1090
	install -m 0444 -t $(DESTDIR)$(libdir) $(lib)/librtlsdr.so.0.5git
	cd $(DESTDIR)$(libdir); ln -s librtlsdr.so.0.5git librtlsdr.so.0; ln -s librtlsdr.so.0 librtlsdr.so
	install -t $(DESTDIR)/etc/init.d $(cwd)/etc/init.d/fadump1090.sh
	install -m 0444 -t $(DESTDIR)$(man1dir) $(docsrc)/*.1.gz
	install -m 0444 -t $(DESTDIR)$(htmldest) $(htmlsrc)/config.js  $(htmlsrc)/extension.js  $(htmlsrc)/options.js  $(htmlsrc)/script.js $(htmlsrc)/gmap.html	 $(htmlsrc)/planeObject.js  $(htmlsrc)/style.css
	install -m 0444 -t $(DESTDIR)$(htmllongpath) $(htmlsrc)/coolclock/coolclock.js  $(htmlsrc)/coolclock/excanvas.js  $(htmlsrc)/coolclock/moreskins.js
