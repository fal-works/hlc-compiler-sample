# hlc-compiler-sample

A small example of HashLink/C native compilation using [hlc-compiler](https://github.com/fal-works/hlc-compiler).

## Prerequisites

### Haxe & HashLink

- [Haxe](https://haxe.org/) 4.1.1 or compatible
- [HashLink](https://hashlink.haxe.org/) 1.11 or compatible
- [GCC](https://gcc.gnu.org/) 9.3.0 or compatible

### Libraries

- [hashlink](https://lib.haxe.org/p/hashlink) 0.1.0 or compatible
- [heaps](https://heaps.io/) 1.8.0 or compatible
- [hlsdl](https://lib.haxe.org/p/hlsdl/) or [hldx](https://lib.haxe.org/p/hldx/) 1.10.0 or compatible
- [hlc-compiler](https://lib.haxe.org/p/hlc-compiler/) 0.2.0 or compatible

```
haxelib install hashlink
haxelib install heaps
haxelib install hlsdl
haxelib install hldx
haxelib install hlc-compiler
```


## Usage

- Windows: Run `test-win.bat`
- Mac: Run `test-mac.command`

This will compile `Main.hx` and generate an executable (just a black screen with sound effect) in the `bin` directory.

Edit `libraries.hxml` to exclude some libraries.

If you are having errors, see also: https://github.com/fal-works/hlc-compiler/wiki


## Misc

The sample sound (`res/sound.wav`) is from: https://freesound.org/people/TolerableDruid6/sounds/461008/ ( [CC0](https://creativecommons.org/publicdomain/zero/1.0/) )
