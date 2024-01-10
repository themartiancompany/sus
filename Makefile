#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/sus
LIB_DIR=$(DESTDIR)$(PREFIX)/lib

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard ur/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 sus/sus "$(BIN_DIR)/sus"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
