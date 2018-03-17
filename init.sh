#!/usr/bin/env sh

if [ ! -d "src" ]; then
	mkdir src
fi

if [ ! -d "asm" ]; then
	mkdir asm
	mkdir asm/x86
	mkdir asm/x64
	mkdir asm/arm
	mkdir asm/arm64
	mkdir asm/mips
	mkdir asm/ppc
fi

if [ ! -d "obj" ]; then
	mkdir obj
	mkdir obj/x86
	mkdir obj/x64
	mkdir obj/arm
	mkdir obj/arm64
	mkdir obj/mips
	mkdir obj/ppc
fi

if [ ! -d "bin" ]; then
	mkdir bin
	mkdir bin/x86
	mkdir bin/x64
	mkdir bin/arm
	mkdir bin/arm64
	mkdir bin/mips
	mkdir bin/ppc
fi

echo "[ WARNING ] To be continue the script will install cross-compiling tookits, but it may uninstall gcc-multilib package!"
read -p "[ WARNING ] Do u want to continue? [yes/no]: " choice
case $choice in
y|Y|[yY][eE][sS])
	sudo apt update
	sudo apt install gcc-7-arm-linux-gnueabi gcc-7-aarch64-linux-gnu gcc-7-mips-linux-gnu gcc-7-powerpc-linux-gnu
	;;
n|N|[nN][oO])
	echo ""
	echo "The script will not install cross-compiling tookits automatically, please install them by yourself."
	;;
esac

if [ ! -f /usr/local/bin/gcc-arm ]; then
	if [ ! -f /usr/bin/arm-linux-gnueabi-gcc-7 ]; then
		echo "run 'sudo apt install gcc-7-arm-linux-gnueabi' to install arm compiler"	
	else
		sudo ln -s /usr/bin/arm-linux-gnueabi-gcc-7 /usr/local/bin/gcc-arm
	fi
fi

if [ ! -f /usr/local/bin/gcc-arm64 ]; then
	if [ ! -f /usr/bin/aarch64-linux-gnu-gcc-7 ]; then
		echo "run 'sudo apt install gcc-7-aarch64-linux-gnu' to install arm64 compiler"	
	else
		sudo ln -s /usr/bin/aarch64-linux-gnu-gcc-7 /usr/local/bin/gcc-arm64
	fi
fi

if [ ! -f /usr/local/bin/gcc-mips ]; then
	if [ ! -f /usr/bin/mips-linux-gnu-gcc-7 ]; then
		echo "run 'sudo apt install gcc-7-mips-linux-gnu' to install mips compiler"	
	else
		sudo ln -s /usr/bin/mips-linux-gnu-gcc-7 /usr/local/bin/gcc-mips
	fi
fi

if [ ! -f /usr/local/bin/gcc-ppc ]; then
	if [ ! -f /usr/bin/powerpc-linux-gnu-gcc-7 ]; then
		echo "run 'sudo apt install gcc-7-powerpc-linux-gnu' to install powerpc compiler"	
	else
		sudo ln -s /usr/bin/powerpc-linux-gnu-gcc-7 /usr/local/bin/gcc-ppc
	fi
fi

echo ""
echo "[ SUCCESS ] init process finished success."
