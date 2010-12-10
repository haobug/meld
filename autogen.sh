#!/bin/sh

(cd $(dirname $0);
    touch AUTHORS README ChangeLog &&
    gnome-doc-common --copy &&
    gnome-doc-prepare --automake --copy --force &&
    intltoolize --automake --copy &&
    autoreconf -I m4 --install --symlink &&
    ./configure --enable-maintainer-mode $@
)
