TARGET = libminui.a
SOURCES := graphics.c graphics_fbdev.c graphics_drm.c events.c resources.c
OBJECTS := $(patsubst %.c, %.o, $(SOURCES))
CC = gcc
AR = ar cqs
INSTALL_FILE = install -m 644 -p -D
CFLAGS = -Wall -DOVERSCAN_PERCENT=0 -I/usr/include/ -O2 -W `pkg-config --cflags libdrm`
LDFLAGS = -lpng -lc -lz -lm `pkg-config --libs libdrm`
INCPATH =

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(AR) $(TARGET) $(OBJECTS)

events.o: events.c minui.h
	$(CC) -c $(CFLAGS) $(INCPATH) -o events.o events.c

graphics.o: graphics.c font_10x18.h minui.h graphics.h
	$(CC) -c $(CFLAGS) $(INCPATH) -o graphics.o graphics.c

graphics_fbdev.o: graphics_fbdev.c minui.h graphics.h
	$(CC) -c $(CFLAGS) $(INCPATH) -o graphics_fbdev.o graphics_fbdev.c

graphics_drm.o: graphics_drm.c minui.h graphics.h
	$(CC) -c $(CFLAGS) $(INCPATH) -o graphics_drm.o graphics_drm.c

resources.o: resources.c minui.h
	$(CC) -c $(CFLAGS) $(INCPATH) -o resources.o resources.c

install: all
	$(INSTALL_FILE) $(TARGET) $(DESTDIR)/usr/lib/$(TARGET)
	$(INSTALL_FILE) minui.h $(DESTDIR)/usr/include/minui/minui.h
	$(INSTALL_FILE) minui.pc $(DESTDIR)/usr/lib/pkgconfig/minui.pc

clean:
	rm -f *.o $(TARGET)

