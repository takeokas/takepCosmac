
ASM= ../Asm-02-main/asm02

all: tst.hex tst.prg 

tst.hex: tst.asm
	$(ASM) -i  tst.asm
	cp tst.hex ~/tmp

tst.prg: tst.asm
	$(ASM)   tst.asm

