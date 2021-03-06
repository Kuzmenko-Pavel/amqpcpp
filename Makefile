SHELL = /bin/sh


prefix_ = /usr/local
real_include := $(prefix_)/include
real_lib := $(prefix_)/lib

ifneq ($(DESTDIR),)
	prefix_ = $(DESTDIR)/usr/local
endif

subdirs = @subdirs@
top_srcdir = .
srcdir = ./src
includedir = ./include
builddir = ./build
prelibdir = ./lib
pkgconfig_DATA = amqpcpp.pc
prefix = $(prefix_)
exec_prefix = ${prefix}
infodir = $(prefix)/info
libdir = $(prefix)/lib
pkgconfigdir = $(libdir)/pkgconfig/
headerdir = $(prefix)/include

CXX = g++
CPPFLAGS =  
LDFLAGS = 
LIBS = -lrabbitmq 
INSTALL = @INSTALL@
MKDIR = mkdir
RANLIB = ranlib

PRODUCT_NAME=amqpcpp

EXFILES  = $(shell echo examples/*.cpp)
EXAMPLES = $(EXFILES:.cpp=)

all: static shared $(EXAMPLES)

clean:
	$(RM) -r ${builddir}
	$(RM) -r ${prelibdir}
	$(RM) config.{h,log,status}
	$(RM) Makefile

static:
	$(MAKE) -f Makefile-static.mk CONF=static .build-conf

shared:
	$(MAKE) -f Makefile-shared.mk CONF=shared .build-conf

$(EXAMPLES): $(EXFILES)
	$(CXX) $(CPPFLAGS) $(LDFLAGS) -o $@ $@.cpp -L ${prelibdir} -l${PRODUCT_NAME}

install:
	$(MKDIR) -p $(libdir)
	$(MKDIR) -p $(headerdir)
	$(MKDIR) -p $(pkgconfigdir)
	cp $(prelibdir)/* $(libdir)
	cp $(includedir)/* $(headerdir)
	cp $(pkgconfig_DATA) $(pkgconfigdir)
	@echo "usage: pkg-config --cflags --libs amqpcpp"
	@echo $(shell pkg-config --cflags --libs amqpcpp)

