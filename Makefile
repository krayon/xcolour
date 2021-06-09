DESTDIR =
PREFIX = /usr/local
CARGO_FLAGS =

.PHONY: all target/release/xcolour install help

all: target/release/xcolour

target/release/xcolour:
	cargo build --release $(CARGO_FLAGS)

install: target/release/xcolour
	install -s -D -m755 -- target/release/xcolour "$(DESTDIR)$(PREFIX)/bin/xcolour"
	install -D -m644 -- man/xcolour.1 "$(DESTDIR)$(PREFIX)/share/man/man1/xcolour.1"
	install -D -m644 -- extra/xcolour.desktop "$(DESTDIR)$(PREFIX)/share/applications/xcolour.desktop"
	install -D -m644 -- extra/icons/xcolour-16.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/16x16/apps/xcolour.png"
	install -D -m644 -- extra/icons/xcolour-24.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/24x24/apps/xcolour.png"
	install -D -m644 -- extra/icons/xcolour-32.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/32x32/apps/xcolour.png"
	install -D -m644 -- extra/icons/xcolour-48.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/48x48/apps/xcolour.png"
	install -D -m644 -- extra/icons/xcolour-256.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/256x256/apps/xcolour.png"
	install -D -m644 -- extra/icons/xcolour-512.png "$(DESTDIR)$(PREFIX)/share/icons/hicolor/512x512/apps/xcolour.png"

help:
	@echo "Available make targets:"
	@echo "  all      - Build xcolour (default)"
	@echo "  install  - Build and install xcolour"
	@echo "  help     - Print this help"

