ASSEMBLER=nasm
OBJS=basic.bin
TARGET=$(OBJS)
FLAGS=-f bin

all: $(TARGET)

%.bin: %.asm
	$(ASSEMBLER) $(FLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.bin