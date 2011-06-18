
import os
import sys

# If running uninstalled, use default values; otherwise, require defs module
melddir = os.path.abspath(os.path.join(
              os.path.dirname(os.path.realpath(__file__)), ".."))

if os.path.exists(os.path.join(melddir, "meld.doap")):
    INSTALLED = 0
    PACKAGE = "meld"
    VERSION = "0.0.0.0.1.badger"
    DATADIR = os.path.join(melddir, "data")
    HELPDIR = os.path.join(melddir, "help")
    LOCALEDIR = os.path.join(melddir, "po")
else:
    INSTALLED = 1
    from defs import *
