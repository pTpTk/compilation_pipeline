all: output
	chmod +x bin/output

output: crtObj outputObj
	bin/link bin/crt.o bin/output.o bin/output

crtObj: init
	bin/assemble src/crt.s bin/crt.o

outputObj: outputAsm
	bin/assemble bin/output.s bin/output.o

outputAsm:
	bin/compile src/main.c bin/output.s

init:
	mkdir -p bin
	g++ -g $(wildcard compiler/*.cpp)  -o bin/compile
	g++ -g $(wildcard assembler/*.cpp) -o bin/assemble
	g++ -g $(wildcard linker/*.cpp)    -o bin/link
