BOOT_IMAGE = output/boot.img

.SUFFIXES: .asm .bin
.asm.bin:
	nasm -f bin -o $@ $<

all: setup
.PHONY: all

setup: clean
	@bash -c ./setup.sh
.PHONY: setup

clean:
	@rm -rf ./output/*
	@find . -name "*.bin" | xargs rm -f
.PHONY: clean

exercise1: ./exercises/exercise1/boot.bin
	dd if=$< of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
.PHONY: exercise1
