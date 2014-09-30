LIB=usr/lib
BIN=usr/bin

PKG=fadump1090
VERSION=1.13
SUBVERSION=1
PKGNAME="${PKG}-${VERSION}-${SUBVERSION}"

PKG_LIB=$(LIB)/fa_adept_packages
AD_LIB=$(LIB)/piaware-config
CLIENT_LIB=$(LIB)/piaware

PLIB=debian/$(PKG_LIB)
CLIB=debian/$(CLIENT_LIB)
ALIB=debian/$(AD_LIB)

TCLSH=tclsh8.5

pkg:   ship-list
	mkdir -p $(PKGNAME)
	tar cvf pkg.tar --directory / --files-from ship-list 
	gzip pkg.tar
	cp files/Makefile $(PKGNAME)/Makefile
	cp pkg.tar.gz $(PKGNAME)
	tar xvf pkg.tar.gz -C $(PKGNAME)
	rm -v $(PKGNAME)/pkg.tar.gz
	tar cvf $(PKG)_$(VERSION).orig.tar $(PKGNAME)
	gzip $(PKG)_$(VERSION).orig.tar

clean:
	rm -rf $(PKGNAME)*
	rm -rf $(PKG)_$(VERSION)*
	rm -f pkg.tar*
