# hlc-compiler-sample

A small example of HashLink/C native compilation using [hlc-compiler](https://github.com/fal-works/hlc-compiler).

The example project to be compiled uses [Heaps.io](https://heaps.io/).


## Prerequisites

### Important ones

- [Haxe](https://haxe.org/) 4.2.3 or compatible
    - Avoid using 4.2.4 or 4.2.5 since there is a [regression bug](https://github.com/HaxeFoundation/haxe/issues/10682).
- [HashLink](https://hashlink.haxe.org/) 1.11.0 or compatible
- C compiler
    - Windows: [GCC](https://gcc.gnu.org/) 11.2.0 or compatible
    - Mac: Clang 13.1.6 or compaptible

### lix (optional; not required)

[lix](https://github.com/lix-pm/lix.client) is an alternative package manager for Haxe projects.

If you aren't using lix, you can ignore the following files in this repository:

- `.haxerc`
- `haxe_libraries/`

### Haxe library dependencies

For targeting HashLink:

- [hashlink](https://lib.haxe.org/p/hashlink) 0.1.0 or compatible

For use in the example project:

- [heaps](https://heaps.io/) 1.9.1 or compatible
- [hlsdl](https://lib.haxe.org/p/hlsdl/) / [hldx](https://lib.haxe.org/p/hldx/) 1.10.0 or compatible

To install:

```sh
haxelib newrepo
haxelib install hashlink
haxelib install heaps
haxelib install hlsdl
haxelib install hldx
```

Or, if using [lix](https://github.com/lix-pm/lix.client), just:

```sh
lix download
```

### hlc-compiler

[hlc-compiler](https://lib.haxe.org/p/hlc-compiler/) 0.3.0 or compatible

```sh
haxelib newrepo
haxelib install hlc-compiler
```

We aren't using [lix](https://github.com/lix-pm/lix.client) here, because the `lix run` command does not work perfectly smoothly so far.


## Usage

### Compile/Test: Haxe -> HL/C -> executable

```sh
haxe -cp scripts --run Compile
```

Or, if using [lix](https://github.com/lix-pm/lix.client), just:

```sh
lix Compile
```

The above will generate:

- HL/C code in the `out/` directory, and
- executable file (with other runtime files) in the `bin/` directory.

You may also add optional arguments as below (simply add them to the commandline above):

- `--clean` : Cleanup the output directories (`out/` and `bin/`) before the compilation.
- `--test` : Runs the generated executable once the compilation completes.

### Compile just HL/C -> executable

The file below defines a single commandline for invoking `haxelib run hlc-compiler` with some options.

- On Winows: `run-hlc-compiler.bat`
- On Mac: `run-hlc-compiler.command`

### Select libraries to be included

Edit `libraries.hxml` to switch/exclude some libraries.

The `USE_???` defines have actually no effect in this sample project (see `src/Main.hx`), but you can see how they affect the compilation result (i.e. what kind of files will be output into `bin/`) by enabling/disabling them.

### Compile a minimum CLI application

To test compiling a minimum CLI app:

- Replace the entire content of `src/Main.hx` with a minimized `main()` function.
    - Such as: `function main() Sys.println("Hello world!");`
- Comment out all the lines in `libraries.hxml`.
- Remove unnecessary options for hlc-compiler in the `run-hlc-compiler.bat/command` file.
    - Such as: `--copyRuntimeFiles`, `--runtime`, `-mwindows`


## Misc

### Errors?

If you're having errors,

- try `haxe hl-jit.hxml --cmd 'hl out/main.hl'` to test on the HL/JIT target and see if it reproduces.
- see also: <https://github.com/fal-works/hlc-compiler/wiki>

### Abount the sample resource

The sample sound (`res/sound.wav`) is from: <https://freesound.org/people/mikepro/sounds/438921/> ( [CC0 License](https://creativecommons.org/publicdomain/zero/1.0/) )
