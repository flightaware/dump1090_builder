prefix = /usr
orig_prefix=/usr
libdir=$(prefix)/lib
bindir = $(prefix)/bin
sharedir = $(prefix)/share
mandir = $(sharedir)/man
man1dir = $(mandir)/man1
launch_lib_dir = $(prefix)/lib/Tcllauncher1.4

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
llib=$(lib)/Tcllauncher1.4
piawarestatus_src=$(lib)/piaware-status
dbin=$(src)/bin
docsrc=$(src)/share/man/man1
tclsh=tclsh8.5

dump1090share_src=$(src)/share/dump1090
dump1090sharedir = $(sharedir)/dump1090

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
	install -d $(DESTDIR)$(dump1090sharedir)

	install -m 0444 -t $(DESTDIR)$(launch_lib_dir) $(llib)/tcllauncher.tcl $(llib)/libTcllauncher1.4.so $(llib)/tcllauncher-support.tcl $(llib)/pkgIndex.tcl
	install -t $(DESTDIR)$(bindir) $(dbin)/piaware $(dbin)/piaware-config  $(dbin)/piaware-status $(dbin)/faup1090 $(dbin)/dump1090
	install -m 0444 -t $(DESTDIR)$(client_lib) $(clib)/main.tcl $(clib)/health.tcl $(clib)/faup1090.tcl $(clib)/helpers.tcl $(clib)/config.tcl
	install -m 0444 -t $(DESTDIR)$(pkg_lib) $(plib)/DigiCertCA.crt $(plib)/pkgIndex.tcl $(plib)/fa_adept_config.tcl $(plib)/fa_adept_client.tcl $(plib)/piaware.tcl
	install -m 0444 -t $(DESTDIR)$(ad_lib) $(alib)/main.tcl $(alib)/helpers.tcl
	install -m 0444 -t $(DESTDIR)$(piawarestatus_lib) $(piawarestatus_src)/main.tcl $(piawarestatus_src)/helpers.tcl
	install -t $(DESTDIR)/etc/init.d $(cwd)/etc/init.d/piaware
	install -m 0444 -t $(DESTDIR)$(man1dir) $(docsrc)/*.1.gz
	install -m 0444 -t $(DESTDIR)$(dump1090sharedir) $(dump1090share_src)

