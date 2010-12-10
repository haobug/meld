LIST_END =

if HAVE_GNOME_DOC_UTILS
help_subdirs = help
else
help_subdirs =
endif

SUBDIRS = po $(help_subdirs)

meldbindir = $(bindir)
meldbin_SCRIPTS = \
	bin/meld

meldpkgdir = $(MELD_PACKAGE_DIR)
meldpkg_PYTHON =                            \
            meld/conf.py                    \
            meld/defs.py                    \
            meld/diffmap.py                 \
            meld/diffutil.py                \
            meld/dirdiff.py                 \
            meld/filediff.py                \
            meld/filemerge.py               \
            meld/__init__.py                \
            meld/linkmap.py                 \
            meld/matchers.py                \
            meld/meldapp.py                 \
            meld/melddoc.py                 \
            meld/meldwindow.py              \
            meld/merge.py                   \
            meld/misc.py                    \
            meld/patchdialog.py             \
            meld/preferences.py             \
            meld/task.py                    \
            meld/tree.py                    \
            meld/undo.py                    \
            meld/vcview.py                  \
            $(LIST_END)

melduipkgdir = $(MELD_PACKAGE_DIR)/ui
melduipkg_PYTHON =                          \
            meld/ui/emblemcellrenderer.py   \
            meld/ui/findbar.py              \
            meld/ui/gladesupport.py         \
            meld/ui/gnomeglade.py           \
            meld/ui/historyentry.py         \
            meld/ui/__init__.py             \
            meld/ui/listwidget.py           \
            meld/ui/msgarea.py              \
            meld/ui/notebooklabel.py        \
            meld/ui/wraplabel.py            \
            $(LIST_END)

meldutilpkgdir = $(MELD_PACKAGE_DIR)/util
meldutilpkg_PYTHON =                        \
            meld/util/__init__.py           \
            meld/util/namedtuple.py         \
            meld/util/prefs.py              \
            meld/util/sourceviewer.py       \
            $(LIST_END)

meldvcpkgdir = $(MELD_PACKAGE_DIR)/vc
meldvcpkg_PYTHON =                          \
            meld/vc/README                  \
            meld/vc/COPYING                 \
            meld/vc/bzr.py                  \
            meld/vc/cdv.py                  \
            meld/vc/cvs.py                  \
            meld/vc/darcs.py                \
            meld/vc/fossil.py               \
            meld/vc/git.py                  \
            meld/vc/__init__.py             \
            meld/vc/mercurial.py            \
            meld/vc/monotone.py             \
            meld/vc/_null.py                \
            meld/vc/rcs.py                  \
            meld/vc/svk.py                  \
            meld/vc/svn.py                  \
            meld/vc/svn_17.py               \
            meld/vc/tla.py                  \
            meld/vc/_vc.py                  \
            $(LIST_END)

################################################################################
# Icons
################################################################################
gtk_update_icon_cache = gtk-update-icon-cache -f -t $(datadir)/icons/hicolor

install-data-hook: update-icon-cache
uninstall-hook: update-icon-cache
update-icon-cache:
	@-if test -z "$(DESTDIR)"; then \
		echo "Updating Gtk icon cache."; \
		$(gtk_update_icon_cache); \
	else \
		echo "*** Icon cache not updated.  After (un)install, run this:"; \
		echo "***   $(gtk_update_icon_cache)"; \
	fi

icondir = $(pkgdatadir)/icons
icon_DATA = \
            data/icons/button_apply0.xpm                                      \
            data/icons/button_apply1.xpm                                      \
            data/icons/button_copy0.xpm                                       \
            data/icons/button_copy1.xpm                                       \
            data/icons/button_delete.xpm                                      \
            data/icons/COPYING                                                \
            data/icons/COPYING_CCBYSA3                                        \
            data/icons/emblem-meld-newer-file.png                             \
            data/icons/filter-ignored-24.png                                  \
            data/icons/filter-modified-24.png                                 \
            data/icons/filter-nonvc-24.png                                    \
            data/icons/filter-normal-24.png                                   \
            data/icons/meld-locked.png                                        \
            data/icons/meld-unlocked.png                                      \
            data/icons/vc-add-24.png                                          \
            data/icons/vc-checkout-24.png                                     \
            data/icons/vc-commit-24.png                                       \
            data/icons/vc-icon.png                                            \
            data/icons/vc-remove-24.png                                       \
            data/icons/vc-resolve-24.png                                      \
            data/icons/vc-update-24.png                                       \
            $(LIST_END)

iconthemedir = $(datadir)/icons/hicolor
appicon16dir = $(iconthemedir)/16x16/apps
appicon22dir = $(iconthemedir)/22x22/apps
appicon32dir = $(iconthemedir)/32x32/apps
appicon48dir = $(iconthemedir)/48x48/apps
appiconscdir = $(iconthemedir)/scalable/apps

dist_appicon16_DATA = data/icons/hicolor/16x16/apps/meld.png
dist_appicon22_DATA = data/icons/hicolor/22x22/apps/meld.png
dist_appicon32_DATA = data/icons/hicolor/32x32/apps/meld.png
dist_appicon48_DATA = data/icons/hicolor/48x48/apps/meld.png
dist_appiconsc_DATA = data/icons/hicolor/scalable/apps/meld.svg

noinst_icons =                                                                \
            data/icons/hicolor/16x16/apps/meld.xcf                            \
            data/icons/hicolor/22x22/apps/meld.xcf                            \
            data/icons/hicolor/32x32/apps/meld.svg                            \
            data/icons/hicolor/48x48/apps/meld.svg                            \
            $(LIST_END)


################################################################################
# UIManager/Builder files
################################################################################

uidir = $(pkgdatadir)/ui
dist_ui_DATA =                                                                \
            data/ui/dirdiff-ui.xml                                            \
            data/ui/dirdiff.ui                                                \
            data/ui/EditableList.ui                                           \
            data/ui/filediff-ui.xml                                           \
            data/ui/filediff.ui                                               \
            data/ui/findbar.ui                                                \
            data/ui/meldapp-ui.xml                                            \
            data/ui/meldapp.ui                                                \
            data/ui/patch-dialog.ui                                           \
            data/ui/preferences.ui                                            \
            data/ui/vcview-ui.xml                                             \
            data/ui/vcview.ui                                                 \
            $(LIST_END)


################################################################################
# Desktop file
################################################################################
desktopdir = $(datadir)/applications
desktop_in_files = data/meld.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)

# We can't use @INTLTOOL_DESKTOP_RULE@ here due to lp#605826
%.desktop: %.desktop.in
	$(MKDIR_P) $(dir $@); LC_ALL=C $(INTLTOOL_MERGE) -d -u -c \
        $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< $@

################################################################################
# Everything else
################################################################################

dist_man_MANS = meld.1

EXTRA_DIST =                                \
            NEWS                            \
            README                          \
            autogen.sh                      \
            gnome-doc-utils.make            \
            meld.doap                       \
            bin/meld                        \
            data/meld.desktop.in            \
            meld/ui/catalog.xml             \
            m4                              \
            $(icon_DATA)                    \
            $(LIST_END)

dist_noinst_DATA = $(noinst_icons)

CLEANFILES =                                                                  \
	$(desktop_DATA)                                                           \
	$(LIST_END)

DISTCLEANFILES =                                                              \
                 gnome-doc-utils.make                                         \
                 $(desktop_DATA)                                              \
                 $(LIST_END)

MAINTAINERCLEANFILES =                                                        \
               aclocal.m4                                                     \
               config/install-sh                                              \
               config/missing                                                 \
               config/py-compile                                              \
               configure                                                      \
               Makefile.in                                                    \
               $(LIST_END)

DISTCHECK_CONFIGURE_FLAGS = --disable-scrollkeeper

distcheck-hook:
	@echo "Checking against files in git"
	@failed=false;                                                            \
	for f in `cd $(srcdir) && git ls-files -x .gitignore` ; do                \
		if [ "`basename $$f`" == ".gitignore" ] ; then : ; else               \
			if test -e $(distdir)/$$f ; then : ; else                         \
				echo File missing from distribution: $$f ;                    \
				failed=true ;                                                 \
			fi;                                                               \
		fi                                                                    \
	done;                                                                     \
	if $$failed ; then                                                        \
		exit 1 ;                                                              \
	fi

.PHONY: api-docs build-local-app
