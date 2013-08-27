CC = gcc
OBJ = 64tass.o opcodes.o misc.o avl.o my_getopt.o eval.o error.o section.o encoding.o ternary.o file.o values.o variables.o mem.o isnprintf.o macro.o obj.o floatobj.o addressobj.o codeobj.o strobj.o listobj.o boolobj.o bytesobj.o intobj.o bitsobj.o
LIBS = -lm
LANG = C
REVISION := $(shell svnversion)
CFLAGS = -O2 -W -Wall -Wextra -Wwrite-strings -Wshadow -fstrict-aliasing -DREVISION="\"$(REVISION)\"" -g -Wstrict-aliasing=2 -Werror=missing-prototypes
LDFLAGS = -g
CFLAGS += $(LDFLAGS)

.SILENT:

all: 64tass README

64tass: $(OBJ)
	$(CC) -o $@ $^ $(LIBS)

64tass.o: 64tass.c 64tass.h inttypes.h opcodes.h misc.h eval.h values.h \
 error.h libtree.h obj.h intobj.h bitsobj.h section.h mem.h encoding.h \
 file.h variables.h macro.h listobj.h codeobj.h strobj.h floatobj.h \
 addressobj.h boolobj.h bytesobj.h
addressobj.o: addressobj.c values.h inttypes.h error.h libtree.h obj.h \
 intobj.h bitsobj.h addressobj.h boolobj.h strobj.h
avl.o: avl.c libtree.h
bitsobj.o: bitsobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h eval.h isnprintf.h misc.h boolobj.h strobj.h addressobj.h \
 listobj.h
boolobj.o: boolobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h boolobj.h strobj.h addressobj.h
bytesobj.o: bytesobj.c values.h inttypes.h error.h libtree.h obj.h \
 intobj.h bitsobj.h bytesobj.h eval.h isnprintf.h boolobj.h strobj.h \
 listobj.h
codeobj.o: codeobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h codeobj.h eval.h mem.h 64tass.h strobj.h addressobj.h \
 listobj.h boolobj.h
encoding.o: encoding.c encoding.h libtree.h inttypes.h error.h ternary.h \
 misc.h
error.o: error.c error.h inttypes.h libtree.h misc.h values.h obj.h \
 intobj.h bitsobj.h file.h variables.h 64tass.h strobj.h
eval.o: eval.c eval.h values.h inttypes.h error.h libtree.h obj.h \
 intobj.h bitsobj.h file.h section.h mem.h encoding.h macro.h variables.h \
 64tass.h misc.h listobj.h floatobj.h strobj.h codeobj.h addressobj.h \
 bytesobj.h
file.o: file.c file.h inttypes.h libtree.h values.h error.h obj.h \
 intobj.h bitsobj.h misc.h 64tass.h
floatobj.o: floatobj.c values.h inttypes.h error.h libtree.h obj.h \
 intobj.h bitsobj.h floatobj.h strobj.h boolobj.h addressobj.h
intobj.o: intobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h eval.h misc.h strobj.h boolobj.h floatobj.h addressobj.h
isnprintf.o: isnprintf.c isnprintf.h inttypes.h misc.h eval.h values.h \
 error.h libtree.h obj.h intobj.h bitsobj.h strobj.h
listobj.o: listobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h listobj.h eval.h isnprintf.h boolobj.h strobj.h
macro.o: macro.c macro.h inttypes.h misc.h file.h libtree.h eval.h \
 values.h error.h obj.h intobj.h bitsobj.h section.h mem.h variables.h \
 64tass.h
mem.o: mem.c mem.h inttypes.h error.h libtree.h file.h misc.h 64tass.h
misc.o: misc.c misc.h inttypes.h 64tass.h opcodes.h getopt.h my_getopt.h \
 section.h libtree.h mem.h encoding.h file.h eval.h values.h error.h \
 obj.h intobj.h bitsobj.h variables.h ternary.h codeobj.h
my_getopt.o: my_getopt.c my_getopt.h
obj.o: obj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h variables.h misc.h section.h mem.h 64tass.h listobj.h \
 boolobj.h addressobj.h codeobj.h floatobj.h strobj.h bytesobj.h
opcodes.o: opcodes.c opcodes.h
section.o: section.c section.h libtree.h inttypes.h mem.h error.h misc.h \
 64tass.h
strobj.o: strobj.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h strobj.h eval.h misc.h isnprintf.h boolobj.h bytesobj.h \
 listobj.h
ternary.o: ternary.c ternary.h misc.h inttypes.h error.h libtree.h
values.o: values.c values.h inttypes.h error.h libtree.h obj.h intobj.h \
 bitsobj.h boolobj.h listobj.h strobj.h bytesobj.h
variables.o: variables.c variables.h libtree.h inttypes.h misc.h values.h \
 error.h obj.h intobj.h bitsobj.h

README: README.html
	-w3m -dump -no-graph README.html | sed -e 's/\s\+$$//' >README

.PHONY: clean

clean:
	rm -f $(OBJ) 64tass *~
