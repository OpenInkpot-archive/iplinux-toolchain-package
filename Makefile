# set DESTDIR to your installation root
DESTDIR ?= /

CONFDIR := $(DESTDIR)/etc/toolchain-package
BINDIR := $(DESTDIR)/usr/bin
LIBDIR := $(DESTDIR)/usr/lib
SBINDIR := $(DESTDIR)/usr/sbin
SCRIPTDIR := $(BINDIR)

SCRIPTS := mktpkg
CONFIGS := config pkglists.conf
all: install-stamp

install: install-stamp
install-stamp:
	# install directories
	install -d $(BINDIR)
	install -d $(CONFDIR)

	# install scripts
	for s in $(SCRIPTS); do \
		install -m755 scripts/$$s $(SCRIPTDIR); \
	done
	for c in $(CONFIGS); do \
		install -m644 $$c $(CONFDIR); \
	done
	
	touch $@

clean:
	rm -f install-stamp

