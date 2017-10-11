ARCH := x86 x64 arm arm64 mips ppc 
DIR_SRC := ./src
DIR_ASM := ./asm
DIR_OBJ := ./obj
DIR_BIN := ./bin
SUB_DIR_ASM := $(patsubst %, $(DIR_ASM)/%, $(ARCH))
SUB_DIR_OBJ := $(patsubst %, $(DIR_OBJ)/%, $(ARCH))
SUB_DIR_BIN := $(patsubst %, $(DIR_BIN)/%, $(ARCH))

SRC := $(wildcard $(DIR_SRC)/*.c)
ASM := $(foreach arch, $(SUB_DIR_ASM), $(patsubst %.c, $(arch)/%.s, $(notdir $(SRC))))
OBJ := $(foreach arch, $(SUB_DIR_OBJ), $(patsubst %.c, $(arch)/%.o, $(notdir $(SRC))))
BIN := $(foreach arch, $(SUB_DIR_BIN), $(patsubst %.c, $(arch)/%, $(notdir $(SRC))))

CC := gcc

all : $(ASM) $(OBJ) $(BIN)

$(DIR_ASM)/x86/%.s : $(DIR_SRC)/%.c
	$(CC) -m32 -S $< -o $@
$(DIR_OBJ)/x86/%.o : $(DIR_SRC)/%.c
	$(CC) -m32 -g -c $< -o $@
$(DIR_BIN)/x86/% : $(DIR_SRC)/%.c
	$(CC) -m32 -g $< -o $@

$(DIR_ASM)/x64/%.s : $(DIR_SRC)/%.c
	$(CC) -S $< -o $@
$(DIR_OBJ)/x64/%.o : $(DIR_SRC)/%.c
	$(CC) -g -c $< -o $@
$(DIR_BIN)/x64/% : $(DIR_SRC)/%.c
	$(CC) -g $< -o $@

$(DIR_ASM)/arm/%.s : $(DIR_SRC)/%.c
	$(CC)-arm -S $< -o $@
$(DIR_OBJ)/arm/%.o : $(DIR_SRC)/%.c
	$(CC)-arm -g -c $< -o $@
$(DIR_BIN)/arm/% : $(DIR_SRC)/%.c
	$(CC)-arm -g $< -o $@

$(DIR_ASM)/arm64/%.s : $(DIR_SRC)/%.c
	$(CC)-arm64 -S $< -o $@
$(DIR_OBJ)/arm64/%.o : $(DIR_SRC)/%.c
	$(CC)-arm64 -g -c $< -o $@
$(DIR_BIN)/arm64/% : $(DIR_SRC)/%.c
	$(CC)-arm64 -g $< -o $@

$(DIR_ASM)/mips/%.s : $(DIR_SRC)/%.c
	$(CC)-mips -S $< -o $@
$(DIR_OBJ)/mips/%.o : $(DIR_SRC)/%.c
	$(CC)-mips -g -c $< -o $@
$(DIR_BIN)/mips/% : $(DIR_SRC)/%.c
	$(CC)-mips -g $< -o $@

$(DIR_ASM)/ppc/%.s : $(DIR_SRC)/%.c
	$(CC)-ppc -S $< -o $@
$(DIR_OBJ)/ppc/%.o : $(DIR_SRC)/%.c
	$(CC)-ppc -g -c $< -o $@
$(DIR_BIN)/ppc/% : $(DIR_SRC)/%.c
	$(CC)-ppc -g $< -o $@

.PHONY: clean
clean:
	for i in $(SUB_DIR_ASM); do \
		rm -rf $$i/*.s; \
	done
	for i in $(SUB_DIR_OBJ); do \
		rm -rf $$i/*.o; \
	done
	for i in $(SUB_DIR_BIN); do \
		rm -rf $$i/*; \
	done
