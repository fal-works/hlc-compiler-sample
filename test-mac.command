#!/bin/sh -eu

echo Cleaning up...
rm -rf out
rm -rf bin

echo Generating HL/C output...
haxe hl-c.hxml
trap 'exit 1' ERR
echo

# add --verbose for more info
haxelib run hlc-compiler --srcDir out/c --outDir bin --saveCmd out/compile_hlc.command --copyRuntimeFiles --runtime res
echo
