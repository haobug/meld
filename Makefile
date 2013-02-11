
.SUFFIXES :

# default install directories
include INSTALL

#
VERSION := $(shell grep "^version" meld/meldapp.py | cut -d \"  -f 2)
RELEASE := meld-$(VERSION)
MELD_CMD := ./meld #--profile
SPECIALS := bin/meld meld/conf.py
BROWSER := firefox

.PHONY:all
all: $(addsuffix .install,$(SPECIALS)) meld.desktop meld.xml
	$(MAKE) -C po
	$(MAKE) -C help

.PHONY:clean
clean: 
	@find ./meld -type f \( -name '*.pyc' -o -name '*.install' \) -print0 |\
		xargs -0 rm -f
	@find ./bin -type f \( -name '*.install' \) -print0 | xargs -0 rm -f
	@rm -f data/meld.desktop
	@rm -f data/mime/meld.xml
	$(MAKE) -C po clean
	$(MAKE) -C help clean

.PHONY:install
install: $(addsuffix .install,$(SPECIALS)) meld.desktop
	mkdir -m 755 -p \
		$(DESTDIR)$(bindir) \
		$(DESTDIR)$(libdir_) \
		$(DESTDIR)$(libdir_)/meld \
		$(DESTDIR)$(libdir_)/meld/ui \
		$(DESTDIR)$(libdir_)/meld/util \
		$(DESTDIR)$(libdir_)/meld/vc \
		$(DESTDIR)$(sharedir_)/ui \
		$(DESTDIR)$(sharedir_)/icons \
		$(DESTDIR)$(docdir_) \
		$(DESTDIR)$(sharedir)/applications \
		$(DESTDIR)$(sharedir)/mime/packages \
		$(DESTDIR)$(sharedir)/pixmaps \
		$(DESTDIR)$(sharedir)/icons/hicolor/16x16/apps \
		$(DESTDIR)$(sharedir)/icons/hicolor/22x22/apps \
		$(DESTDIR)$(sharedir)/icons/hicolor/32x32/apps \
		$(DESTDIR)$(sharedir)/icons/hicolor/48x48/apps \
		$(DESTDIR)$(sharedir)/icons/hicolor/scalable/apps \
		$(DESTDIR)$(sharedir)/icons/HighContrast/scalable/apps \
		$(DESTDIR)$(helpdir_)
	install -m 755 bin/meld.install \
		$(DESTDIR)$(bindir)/meld
	install -m 644 meld/*.py \
		$(DESTDIR)$(libdir_)/meld
	install -m 644 meld/ui/*.py \
		$(DESTDIR)$(libdir_)/meld/ui
	install -m 644 meld/util/*.py \
		$(DESTDIR)$(libdir_)/meld/util
	install -m 644 meld/vc/*.py \
		$(DESTDIR)$(libdir_)/meld/vc
	install -m 644 meld/paths.py.install \
		$(DESTDIR)$(libdir_)/meld/paths.py
	install -m 644 data/meld.desktop \
		$(DESTDIR)$(sharedir)/applications
	install -m 644 data/mime/meld.xml \
		$(DESTDIR)$(sharedir)/mime/packages/
	$(PYTHON)    -c 'import compileall; compileall.compile_dir("$(DESTDIR)$(libdir_)",10,"$(libdir_)")'
	$(PYTHON) -O -c 'import compileall; compileall.compile_dir("$(DESTDIR)$(libdir_)",10,"$(libdir_)")'
	install -m 644 data/gtkrc \
		$(DESTDIR)$(sharedir_)
	install -m 644 \
		data/ui/*.ui \
		$(DESTDIR)$(sharedir_)/ui
	install -m 644 \
		data/ui/*.xml \
		$(DESTDIR)$(sharedir_)/ui
	install -m 644 \
		data/icons/*.xpm \
		data/icons/*.png \
		$(DESTDIR)$(sharedir_)/icons
	install -m 644 data/icons/hicolor/16x16/apps/meld.png \
		$(DESTDIR)$(sharedir)/icons/hicolor/16x16/apps/meld.png
	install -m 644 data/icons/hicolor/22x22/apps/meld.png \
		$(DESTDIR)$(sharedir)/icons/hicolor/22x22/apps/meld.png
	install -m 644 data/icons/hicolor/32x32/apps/meld.png \
		$(DESTDIR)$(sharedir)/icons/hicolor/32x32/apps/meld.png
	install -m 644 data/icons/hicolor/48x48/apps/meld.png \
		$(DESTDIR)$(sharedir)/icons/hicolor/48x48/apps/meld.png
	install -m 644 data/icons/hicolor/scalable/apps/meld.svg \
		$(DESTDIR)$(sharedir)/icons/hicolor/scalable/apps/meld.svg
	install -m 644 data/icons/HighContrast/scalable/apps/meld.svg \
		$(DESTDIR)$(sharedir)/icons/HighContrast/scalable/apps/meld.svg
	$(MAKE) -C po install
	$(MAKE) -C help install
	update-mime-database $(DESTDIR)$(sharedir)/mime
	update-desktop-database $(DESTDIR)$(sharedir)/applications

meld.desktop: data/meld.desktop.in
	intltool-merge -d po data/meld.desktop.in data/meld.desktop

meld.xml: data/mime/meld.xml.in
	intltool-merge -d po data/mime/meld.xml.in data/mime/meld.xml

%.install: %
	$(PYTHON) tools/install_paths \
		libdir=$(libdir_) \
		localedir=$(localedir) \
		helpdir=$(helpdir_) \
		sharedir=$(sharedir_) \
		< $< > $@

.PHONY:uninstall
uninstall:
	-rm -rf \
		$(sharedir_) \
		$(docdir_) \
		$(helpdir_) \
		$(libdir_) \
		$(bindir)/meld \
		$(sharedir)/applications/meld.desktop \
		$(sharedir)/mime/packages/meld.xml \
		$(sharedir)/pixmaps/meld.png
	$(MAKE) -C po uninstall
	$(MAKE) -C help uninstall
	update-mime-database $(DESTDIR)$(sharedir)/mime
	update-desktop-database $(DESTDIR)$(sharedir)/applications

