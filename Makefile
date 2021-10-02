BOOT_IMAGE = output/boot.img

.SUFFIXES: .asm .bin
.asm.bin:
	@nasm -f bin -o $@ $<

all: setup
.PHONY: all

setup: clean
	@bash -c ./setup.sh
.PHONY: setup

clean:
	@rm -rf ./output/*
	@find . -name "*.bin" | xargs rm -f
.PHONY: clean

exercise1: setup ./exercises/exercise1/boot.bin
	@dd if=./exercises/exercise1/boot.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise1

exercise2: setup ./exercises/exercise2/c05_mbr.bin
	@dd if=./exercises/exercise2/c05_mbr.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise2

exercise2-edited: setup ./exercises/exercise2/c05_mbr_edited.bin
	@dd if=./exercises/exercise2/c05_mbr_edited.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise2

exercise3: setup ./exercises/exercise3/boot.bin
	@dd if=./exercises/exercise3/boot.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise3

exercise4-2: setup ./exercises/exercise4/test5-2.bin
	@dd if=./exercises/exercise4/test5-2.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise4

exercise4-3: setup ./exercises/exercise4/test5-3.bin
	@dd if=./exercises/exercise4/test5-3.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise4