AC_INIT([meld], [1.5.2], [http://bugzilla.gnome.org/enter_bug.cgi?product=meld], [meld], [http://projects.gnome.org/meld/])

AM_INIT_AUTOMAKE([dist-bzip2 no-dist-gzip])
AC_CONFIG_SRCDIR([meld/meldapp.py])
AC_CONFIG_MACRO_DIR([m4])
AM_MAINTAINER_MODE
AC_SUBST(ACLOCAL_AMFLAGS, "$ACLOCAL_FLAGS -I m4")

################################################################################
# Translation & i18n
################################################################################
GETTEXT_PACKAGE="meld"
AC_SUBST([GETTEXT_PACKAGE])
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], "$GETTEXT_PACKAGE", [Gettext package])
AM_GLIB_GNU_GETTEXT
IT_PROG_INTLTOOL([0.35.0])

################################################################################
# Gnome Doc Utils
################################################################################
GNOME_DOC_INIT

################################################################################
# Python module requirements
################################################################################
AM_PATH_PYTHON(2.5)
AM_CHECK_PYMOD_VERSION([gio], [pygio_version], [2.16.0], , \
    AC_MSG_ERROR([Python module gio >= 2.16.1 required to run Meld]))
AM_CHECK_PYMOD_VERSION([gobject], [pygobject_version], [2.16.0], , \
    AC_MSG_ERROR([Python module gobject >= 2.16.0 required to run Meld]))
AM_CHECK_PYMOD_VERSION([glib], [pyglib_version], [2.16.0], , \
    AC_MSG_ERROR([Python module glib >= 2.16.0 required to run Meld]))

# This check causes "Could not open display" errors during RPM packaging
#AM_CHECK_PYMOD_VERSION([gtk], [pygtk_version], [2.14.0], , \
#    AC_MSG_ERROR([Python module gtk >= 2.14.0 required to run Meld]))


################################################################################
# Package, version and path substitutions
################################################################################
MELD_PACKAGE_DIR=${pythondir}/$PACKAGE_NAME
AC_SUBST(MELD_PACKAGE_DIR)
AC_SUBST(VERSION)
AC_SUBST(PACKAGE)
AS_AC_EXPAND(PYTHONDIR, $pythondir)
AS_AC_EXPAND(BINDIR, $bindir)
AS_AC_EXPAND(LIBDIR, $libdir)
AS_AC_EXPAND(LOCALEDIR, $datarootdir/locale)
AS_AC_EXPAND(DATADIR, $datarootdir/$PACKAGE)
AS_AC_EXPAND(HELPDIR, $HELP_DIR/$PACKAGE)
AS_AC_EXPAND(DESKTOPFILEDIR, $datarootdir/applications)


AC_CONFIG_FILES([ 
  Makefile
  meld/defs.py
  help/Makefile
  po/Makefile.in
])
AC_OUTPUT
