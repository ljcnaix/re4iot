#!/usr/bin/env sh

ARCH="armv4l armv5l i586 i686 m68k mips mipsel powerpc powerpc-440fp sh4 sparc x86_64"
DIR="asm obj bin"

for d in $DIR
do
    if [ ! -d $d ]; then
        mkdir $d
        for a in $ARCH;
        do
            mkdir $d/$a;
        done
    fi
done

echo "[ INFO ] successfully create directory structure."

if [ ! -d "tools/downloads" ]; then
    ./tools/download.sh
    if [ $(ls tools/downloads | wc -l) -ne 12 ]; then
        echo "[ ERRO ] failed to download cross-compile toolkits, please check your network."
    else
        echo "[ INFO ] successfully download cross-compile toolkits."
    fi
else
    echo "[ INFO ] successfully download cross-compile toolkits."
fi

if [ $(ls tools | wc -l) -lt 14 ]; then
    tgt=$(ls tools/downloads/cross-compiler-*)
    echo "[ INFO ] trying to extract cross-compile toolkits, that may take a few minutes." 
    for f in $tgt;
    do
        tar -xjf $f -C tools;
    done
    if [ $(ls tools | wc -l) -ne 14 ]; then
        echo "[ ERRO ] failed to extract cross-compile toolkits, please do a manual check."
    else
        echo "[ INFO ] successfully extract cross-compile toolkits." 
    fi
else
    echo "[ INFO ] successfully extract cross-compile toolkits." 
fi
    
echo ""
echo "[ SUCCESS ] init process finished, cross-compile tools has been installed."
