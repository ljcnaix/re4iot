ARCH=armv4l armv5l i586 i686 m68k mips mipsel powerpc powerpc-440fp sh4 sparc x86_64
SRC = $(wildcard src/*.c)
ASM = $(foreach arch, $(ARCH), $(patsubst %.c, asm/$(arch)/%.asm, $(notdir $(SRC))))
OBJ = $(foreach arch, $(ARCH), $(patsubst %.c, obj/$(arch)/%.obj, $(notdir $(SRC))))
BIN = $(foreach arch, $(ARCH), $(patsubst %.c, bin/$(arch)/%.bin, $(notdir $(SRC))))

DIR = asm obj bin
TGT_armv4l = $(foreach d, $(DIR), $(patsubst %.c, $(d)/armv4l/%.$(d), $(notdir $(SRC)))) 
TGT_armv5l = $(foreach d, $(DIR), $(patsubst %.c, $(d)/armv5l/%.$(d), $(notdir $(SRC)))) 
TGT_i586 = $(foreach d, $(DIR), $(patsubst %.c, $(d)/i586/%.$(d), $(notdir $(SRC)))) 
TGT_i686 = $(foreach d, $(DIR), $(patsubst %.c, $(d)/i686/%.$(d), $(notdir $(SRC)))) 
TGT_m68k = $(foreach d, $(DIR), $(patsubst %.c, $(d)/m68k/%.$(d), $(notdir $(SRC)))) 
TGT_mips = $(foreach d, $(DIR), $(patsubst %.c, $(d)/mips/%.$(d), $(notdir $(SRC)))) 
TGT_mipsel = $(foreach d, $(DIR), $(patsubst %.c, $(d)/mipsel/%.$(d), $(notdir $(SRC)))) 
TGT_powerpc = $(foreach d, $(DIR), $(patsubst %.c, $(d)/powerpc/%.$(d), $(notdir $(SRC)))) 
TGT_powerpc-440fp = $(foreach d, $(DIR), $(patsubst %.c, $(d)/powerpc-440fp/%.$(d), $(notdir $(SRC)))) 
TGT_sh4 = $(foreach d, $(DIR), $(patsubst %.c, $(d)/sh4/%.$(d), $(notdir $(SRC)))) 
TGT_sparc = $(foreach d, $(DIR), $(patsubst %.c, $(d)/sparc/%.$(d), $(notdir $(SRC)))) 
TGT_x86_64 = $(foreach d, $(DIR), $(patsubst %.c, $(d)/x86_64/%.$(d), $(notdir $(SRC)))) 

all: $(ARCH)

armv4l: SYSROOT=tools/cross-compiler-armv4l
armv4l: CC=$(SYSROOT)/bin/armv4l-gcc
armv4l: PATH=$(SYSROOT)/armv4l-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/armv4l-unknown-linux/4.1.2/:$(shell printenv PATH)
armv4l: C_INCLUDE_PATH=$(SYSROOT)/include
armv4l:	GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
armv4l: UCLIB_PATH=$(SYSROOT)/lib
armv4l: $(TGT_armv4l) 
asm/armv4l/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/armv4l/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/armv4l/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

armv5l: SYSROOT=tools/cross-compiler-armv5l
armv5l: CC=$(SYSROOT)/bin/armv5l-gcc
armv5l: PATH=$(SYSROOT)/armv5l-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/armv5l-unknown-linux/4.1.2/:$(shell printenv PATH)
armv5l: C_INCLUDE_PATH=$(SYSROOT)/include
armv5l: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
armv5l: UCLIB_PATH=$(SYSROOT)/lib
armv5l: $(TGT_armv5l)
asm/armv5l/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/armv5l/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/armv5l/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

i586: SYSROOT=tools/cross-compiler-i586
i586: CC=$(SYSROOT)/bin/i586-gcc
i586: PATH=$(SYSROOT)/i586-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/i586-unknown-linux/4.1.2/:$(shell printenv PATH)
i586: C_INCLUDE_PATH=$(SYSROOT)/include
i586: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
i586: UCLIB_PATH=$(SYSROOT)/lib
i586: $(TGT_i586)
asm/i586/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/i586/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/i586/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

i686: SYSROOT=tools/cross-compiler-i686
i686: CC=$(SYSROOT)/bin/i686-gcc
i686: PATH=$(SYSROOT)/i686-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/i686-unknown-linux/4.1.2/:$(shell printenv PATH)
i686: C_INCLUDE_PATH=$(SYSROOT)/include
i686: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
i686: UCLIB_PATH=$(SYSROOT)/lib
i686: $(TGT_i686)
asm/i686/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/i686/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/i686/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

m68k: SYSROOT=tools/cross-compiler-m68k
m68k: CC=$(SYSROOT)/bin/m68k-gcc
m68k: PATH=$(SYSROOT)/m68k-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/m68k-unknown-linux/4.1.2/:$(shell printenv PATH)
m68k: C_INCLUDE_PATH=$(SYSROOT)/include
m68k: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
m68k: UCLIB_PATH=$(SYSROOT)/lib
m68k: $(TGT_m68k)
asm/m68k/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/m68k/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/m68k/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

mips: SYSROOT=tools/cross-compiler-mips
mips: CC=$(SYSROOT)/bin/mips-gcc
mips: PATH=$(SYSROOT)/mips-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/mips-unknown-linux/4.1.2/:$(shell printenv PATH)
mips: C_INCLUDE_PATH=$(SYSROOT)/include
mips: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
mips: UCLIB_PATH=$(SYSROOT)/lib
mips: $(TGT_mips)
asm/mips/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/mips/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/mips/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

mipsel: SYSROOT=tools/cross-compiler-mipsel
mipsel: CC=$(SYSROOT)/bin/mipsel-gcc
mipsel: PATH=$(SYSROOT)/mipsel-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/mipsel-unknown-linux/4.1.2/:$(shell printenv PATH)
mipsel: C_INCLUDE_PATH=$(SYSROOT)/include
mipsel: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
mipsel: UCLIB_PATH=$(SYSROOT)/lib
mipsel: $(TGT_mipsel)
asm/mipsel/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/mipsel/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/mipsel/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

powerpc: SYSROOT=tools/cross-compiler-powerpc
powerpc: CC=$(SYSROOT)/bin/powerpc-gcc
powerpc: PATH=$(SYSROOT)/powerpc-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/powerpc-unknown-linux/4.1.2/:$(shell printenv PATH)
powerpc: C_INCLUDE_PATH=$(SYSROOT)/include
powerpc: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
powerpc: UCLIB_PATH=$(SYSROOT)/lib
powerpc: $(TGT_powerpc)
asm/powerpc/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/powerpc/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/powerpc/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

powerpc-440fp: SYSROOT=tools/cross-compiler-powerpc-440fp
powerpc-440fp: CC=$(SYSROOT)/bin/powerpc-440fp-gcc
powerpc-440fp: PATH=$(SYSROOT)/powerpc-440fp-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/powerpc-440fp-unknown-linux/4.1.2/:$(shell printenv PATH)
powerpc-440fp: C_INCLUDE_PATH=$(SYSROOT)/include
powerpc-440fp: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
powerpc-440fp: UCLIB_PATH=$(SYSROOT)/lib
powerpc-440fp: $(TGT_powerpc-440fp)
asm/powerpc-440fp/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/powerpc-440fp/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/powerpc-440fp/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

sh4: SYSROOT=tools/cross-compiler-sh4
sh4: CC=$(SYSROOT)/bin/sh4-gcc
sh4: PATH=$(SYSROOT)/sh4-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/sh4-unknown-linux/4.1.2/:$(shell printenv PATH)
sh4: C_INCLUDE_PATH=$(SYSROOT)/include
sh4: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
sh4: UCLIB_PATH=$(SYSROOT)/lib
sh4: $(TGT_sh4)
asm/sh4/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/sh4/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/sh4/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

sparc: SYSROOT=tools/cross-compiler-sparc
sparc: CC=$(SYSROOT)/bin/sparc-gcc
sparc: PATH=$(SYSROOT)/sparc-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/sparc-unknown-linux/4.1.2/:$(shell printenv PATH)
sparc: C_INCLUDE_PATH=$(SYSROOT)/include
sparc: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
sparc: UCLIB_PATH=$(SYSROOT)/lib
sparc: $(TGT_sparc)
asm/sparc/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/sparc/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/sparc/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

x86_64: SYSROOT=tools/cross-compiler-x86_64
x86_64: CC=$(SYSROOT)/bin/x86_64-gcc
x86_64: PATH=$(SYSROOT)/x86_64-unknown-linux/bin:$(SYSROOT)/tools/bin/:$(SYSROOT)/libexec/gcc/x86_64-unknown-linux/4.1.2/:$(shell printenv PATH)
x86_64: C_INCLUDE_PATH=$(SYSROOT)/include
x86_64: GCC_INCLUDE_PATH=$(SYSROOT)/gcc/include
x86_64: UCLIB_PATH=$(SYSROOT)/lib
x86_64: $(TGT_x86_64)
asm/x86_64/%.asm: src/%.c
	$(CC) -S -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
obj/x86_64/%.obj: src/%.c
	$(CC) -g -c -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@
bin/x86_64/%.bin: src/%.c
	$(CC) -g -static -I$(C_INCLUDE_PATH) -I$(GCC_INCLUDE_PATH) -L$(UCLIB_PATH) $< -o $@

.PHONY: clean
clean:

	for i in $(ASM); do \
		rm -rf $$i; \
	done
	for i in $(OBJ); do \
		rm -rf $$i; \
	done
	for i in $(BIN); do \
		rm -rf $$i; \
	done
