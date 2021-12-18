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

exercise5-1: setup ./exercises/exercise5/test6-1.bin
	@dd if=./exercises/exercise5/test6-1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise5-1

exercise6-1: setup ./exercises/exercise6/test7-1.bin
	@dd if=./exercises/exercise6/test7-1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise6-1

exercise7-2: setup ./exercises/exercise7/test8-2.bin
	@dd if=./exercises/exercise7/test8-2.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise7-2

exercise8-1: setup ./exercises/exercise8/1.bin
	@dd if=./exercises/exercise8/1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise8-1

exercise8-2: setup ./exercises/exercise8/2.bin
	@dd if=./exercises/exercise8/2.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q
.PHONY: exercise8-2

exercise9: setup ./exercises/exercise9/section1.bin
	@dd if=./exercises/exercise9/section1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise10: setup ./exercises/exercise10/date.bin
	@dd if=./exercises/exercise10/date.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise11: setup ./exercises/exercise11/CMOS_date_call.bin
	@dd if=./exercises/exercise11/CMOS_date_call.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise12-1: setup ./exercises/exercise12/test12-1.bin ./exercises/exercise12/db_hello.bin
	@dd if=./exercises/exercise12/db_hello.bin of=$(BOOT_IMAGE) bs=512 count=1 seek=100 conv=notrunc
	@dd if=./exercises/exercise12/test12-1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise12-2: setup ./exercises/exercise12/test12-2.bin
	@dd if=./exercises/exercise12/test12-2.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise13-1: setup ./exercises/exercise13/test12-3.bin ./exercises/exercise13/db_hello.bin ./exercises/exercise13/db_world.bin
	@dd if=./exercises/exercise13/db_hello.bin of=$(BOOT_IMAGE) bs=512 count=1 seek=100 conv=notrunc
	@dd if=./exercises/exercise13/db_world.bin of=$(BOOT_IMAGE) bs=512 count=1 seek=101 conv=notrunc
	@dd if=./exercises/exercise13/test12-3.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise13-2: setup ./exercises/exercise13/test13-1.bin
	@dd if=./exercises/exercise13/test13-1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise16-1: setup ./exercises/exercise16/test16-1.bin
	@dd if=./exercises/exercise16/test16-1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise16-2: setup ./exercises/exercise16/test16-2.bin
	@dd if=./exercises/exercise16/test16-2.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise17: setup ./exercises/exercise17/test17.bin
	@dd if=./exercises/exercise17/test17.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q

exercise17-test: setup ./exercises/exercise17/c09_1.bin
	@dd if=./exercises/exercise17/c09_1.bin of=$(BOOT_IMAGE) bs=512 count=1 conv=notrunc
	@bochs -q