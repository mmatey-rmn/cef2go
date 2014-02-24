.PHONY: Linux clean

UNAME_S = $(shell uname -s)

INC=-I. \
	-I/usr/include/gtk-2.0 \
	-I/usr/include/glib-2.0 \
	-I/usr/include/cairo \
	-I/usr/include/pango-1.0 \
	-I/usr/include/gdk-pixbuf-2.0 \
	-I/usr/include/atk-1.0 \
	-I/usr/lib/x86_64-linux-gnu/glib-2.0/include \
	-I/usr/lib/x86_64-linux-gnu/gtk-2.0/include \
	-I/usr/lib/i386-linux-gnu/gtk-2.0/include \
	-I/usr/lib/i386-linux-gnu/glib-2.0/include \
	-I/usr/lib64/glib-2.0/include \
	-I/usr/lib64/gtk-2.0/include
export CC=gcc $(INC)
export CGO_LDFLAGS=-L $(PWD)/Release -lcef

Linux:
	clear
	go install cef2go/gtk
	go install cef2go/cef

clean:
	clear
	go clean -i cef
