.PHONY: all modules install modules_install clean

# external KDIR specification is supported
KDIR ?= /lib/modules/$(shell uname -r)/build

all: modules

install: modules_install

modules modules_install clean:
	make -C $(KDIR) M=$$PWD $@

dev:
	make clean
	make
	sudo rmmod aquacomputer_d5next || true
	sudo insmod aquacomputer_d5next.ko