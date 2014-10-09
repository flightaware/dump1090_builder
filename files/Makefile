prefix = /usr
orig_prefix=/usr
libdir=$(prefix)/lib
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1
launch_lib_dir = $(prefix)/lib/Tcllauncher1.5

pkg_lib=$(libdir)/fa_adept_packages
ad_lib=$(libdir)/piaware-config
piawarestatus_lib=$(libdir)/piaware-status
client_lib=$(libdir)/piaware

cwd=$$(pwd)
src=$(cwd)$(orig_prefix)
lib=$(src)/lib
plib=$(lib)/fa_adept_packages
clib=$(lib)/piaware
alib=$(lib)/piaware-config
llib=$(lib)/Tcllauncher1.5
piawarestatus_src=$(lib)/piaware-status
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
	install -d $(DESTDIR)$(client_lib)
	install -d $(DESTDIR)$(pkg_lib)
	install -d $(DESTDIR)$(ad_lib)
	install -d $(DESTDIR)$(piawarestatus_lib)
	install -d $(DESTDIR)$(launch_lib_dir)
	install -d $(DESTDIR)/etc/init.d
	install -d $(DESTDIR)$(man1dir)
	install -d $(DESTDIR)$(htmllongpath)

	install -m 0444 -t $(DESTDIR)$(launch_lib_dir) $(llib)/tcllauncher.tcl $(llib)/tcllauncher-support.tcl $(llib)/pkgIndex.tcl
	install -t $(DESTDIR)$(bindir) $(dbin)/piaware $(dbin)/piaware-config  $(dbin)/piaware-status $(dbin)/faup1090 $(dbin)/dump1090
	install -m 0444 -t $(DESTDIR)$(libdir) $(lib)/librtlsdr.so.0.5git
	cd $(DESTDIR)$(libdir); ln -s librtlsdr.so.0.5git librtlsdr.so.0; ln -s librtlsdr.so.0 librtlsdr.so
	install -m 0444 -t $(DESTDIR)$(client_lib) $(clib)/main.tcl $(clib)/health.tcl $(clib)/faup1090.tcl $(clib)/helpers.tcl $(clib)/config.tcl
	install -m 0444 -t $(DESTDIR)$(pkg_lib) $(plib)/DigiCertCA.crt $(plib)/pkgIndex.tcl $(plib)/fa_adept_config.tcl $(plib)/fa_adept_client.tcl $(plib)/piaware.tcl
	install -m 0444 -t $(DESTDIR)$(ad_lib) $(alib)/main.tcl $(alib)/helpers.tcl
	install -m 0444 -t $(DESTDIR)$(piawarestatus_lib) $(piawarestatus_src)/main.tcl $(piawarestatus_src)/helpers.tcl
	install -t $(DESTDIR)/etc/init.d $(cwd)/etc/init.d/piaware $(cwd)/etc/init.d/fadump1090.sh
	install -m 0444 -t $(DESTDIR)$(man1dir) $(docsrc)/*.1.gz
	install -m 0444 -t $(DESTDIR)$(htmldest) $(htmlsrc)/config.js  $(htmlsrc)/extension.js  $(htmlsrc)/options.js  $(htmlsrc)/script.js $(htmlsrc)/gmap.html	 $(htmlsrc)/planeObject.js  $(htmlsrc)/style.css
	install -m 0444 -t $(DESTDIR)$(htmllongpath) $(htmlsrc)/coolclock/coolclock.js  $(htmlsrc)/coolclock/excanvas.js  $(htmlsrc)/coolclock/moreskins.js
