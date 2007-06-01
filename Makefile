# set DESTDIR to your installation root
DESTDIR ?= /

CONFDIR := $(DESTDIR)/etc/toolchain-package
BINDIR := $(DESTDIR)/usr/bin
LIBDIR := $(DESTDIR)/usr/lib
SBINDIR := $(DESTDIR)/usr/sbin
SCRIPTDIR := $(BINDIR)

SCRIPTS := mktpkg
CONFIGS := config pkglists.conf
all: install

install:
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

clean:
	rm -f install-stamp

