#!/bin/sh

GCC_VER=4.5.1
D1=gdc-d1/dev/gcc-stage-tdm32-4.5sjlj
D2=gdc-d2/dev/gcc-stage-tdm32-4.5sjlj

mkdir -p release/bin
mkdir -p release/include
mkdir -p release/lib
mkdir -p release/libexec/gcc/mingw32/$GCC_VER
mkdir -p release/share/man/man1/

#Copy D1 items
cp $D1/lib/libgphobos.a release/lib
cp -rf $D1/include/d release/include
cp $D1/libexec/gcc/mingw32/$GCC_VER/cc1d.exe release/libexec/gcc/mingw32/$GCC_VER/

#Copy D2 items.
cp $D2/lib/libgphobos2.a release/lib
cp -rf $D2/include/d2 release/include
cp $D2/libexec/gcc/mingw32/$GCC_VER/cc1d.exe release/libexec/gcc/mingw32/$GCC_VER/cc1d2.exe


# Non unique items
cp $D1/bin/gdc.exe release/bin
cp $D1/bin/gdmd    release/bin
cp $D1/bin/mingw32-gdc.exe release/bin
cp $D1/bin/mingw32-gdmd    release/bin

cp $D1/share/man/man1/gdc.1 release/share/man/man1/
cp $D1/share/man/man1/gdmd.1 release/share/man/man1/

#Compile gdmd for use outside msys.
#pp gdmd


#gcc-<ver>-<tdm>-gdc-<revision>.zip
#gcc-<ver>-<tdm>-gdc-<revision>.tar.lzma

#Separate Debugging Info
#gdc -g foo.d -o foo.exe
#objcopy --only-keep-debug foo.exe foo.debug
#strip -g foo.exe
#bjcopy --add-gnu-debuglink=foo.debug foo.exe
