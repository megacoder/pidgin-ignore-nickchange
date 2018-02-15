VERSION	:=0.0.0
CC	:= gcc -march=native -std=gnu99
CFLAGS	=-DVERSION='"${VERSION}"'
CFLAGS	+=-O3 -Wall -pedantic -fPIC
CFLAGS	+=`pkg-config --cflags glib-2.0`
CFLAGS	+=`pkg-config --cflags purple`
CFLAGS	+=`pkg-config --cflags pidgin`

LDFLAGS	=-shared

LDLIBS	=
LDLIBS	+=`pkg-config --libs glib-2.0`
LDLIBS	+=`pkg-config --libs purple`
LDLIBS	+=`pkg-config --libs pidgin`

all::	purple-plugin-ignore-nickchange.so

purple-plugin-ignore-nickchange.so:: purple-plugin-ignore-nickchange.c
	${CC} -o $@ ${CFLAGS} ${LDFLAGS} ${LDLIBS} $^

install:: purple-plugin-ignore-nickchange.so
	install -D $^ /usr/lib64/pidgin/$^

clean::
	${RM} *.o *~ a.out core*

clobber distclean:: clean
	${RM} *.so
