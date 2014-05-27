
BIN ?= vipe
PREFIX ?= /usr/local

$(BIN): install

install:
	install vipe.sh $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
