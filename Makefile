LIB=usr/lib
BIN=usr/bin

PKG=dump1090
VERSION=1.0
SUBVERSION=1
PKGNAME="${PKG}-${VERSION}-${SUBVERSION}"

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
