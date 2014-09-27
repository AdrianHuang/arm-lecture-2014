CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
random_num = $(shell echo `od -An -N1 -i /dev/urandom` % 20 | bc)

qemu: fibseq
	@echo $(shell echo $(random_num)) | $(call QEMU_CMD)
	@sleep 1
	@echo $(shell echo $(random_num)) | $(call QEMU_CMD)
	@sleep 1
	@echo $(shell echo $(random_num)) | $(call QEMU_CMD)
	@sleep 1
