#!/bin/sh -eu

# add --verbose for more info
haxelib run hlc-compiler --srcDir out/c --outDir bin --saveCmd out/compile_hlc.command --copyRuntimeFiles --runtime res
