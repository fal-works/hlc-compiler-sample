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

- For targeting HashLink:
    - [hashlink](https://lib.haxe.org/p/hashlink) 0.1.0 or compatible
- For use in the example project:
    - [heaps](https://heaps.io/) 1.9.1 or compatible
    - [hlsdl](https://lib.haxe.org/p/hlsdl/) / [hldx](https://lib.haxe.org/p/hldx/) 1.10.0 or compatible
- For compiling HL/C into executable:
    - [hlc-compiler](https://lib.haxe.org/p/hlc-compiler/) 0.3.0 or compatible

To install:

```sh
haxelib newrepo
haxelib install hashlink
haxelib install heaps
haxelib install hlsdl
haxelib install hldx
haxelib install hlc-compiler
```

Or, if using [lix](https://github.com/lix-pm/lix.client), just:

```sh
lix download
```


## Usage

### Compile Haxe -> HL/C

Run Haxe with:

```sh
haxe hxml/build-hl-c.hxml
```

This will:

1. compile the example source code in `src/`, and
2. generate HL/C code in the `out/c/` directory.

### Compile HL/C -> executable

Run the file below, which defines a single commandline for invoking `haxelib run hlc-compiler` with some options.

- On Windows: `run-hlc-compiler.bat`
- On Mac: `run-hlc-compiler.command`

This will generate:

- Executable file (with other runtime files) in the `bin/` directory
- Command file for re-compiling in the `out/` directory

### One-stop compiling & testing

To run the build processes above at once:

```sh
haxe -cp scripts --run Compile
```

Or, if using [lix](https://github.com/lix-pm/lix.client), just:

```sh
lix Compile
```

See `scripts/Compile.hx` for what it does.

You may also add optional arguments as below (simply add them to the commandline above):

- `--clean` or `-c` : Cleanup the output directories (`out/` and `bin/`) before the compilation.
- `--test` or `-t` : Runs the generated executable once the compilation completes.

### Select libraries to be included

Edit `hxml/libraries.hxml` to switch/exclude some libraries.

The `USE_???` defines have actually no effect in this sample project (see `src/Main.hx`), but you can see how they affect the compilation result (i.e. what kind of files will be output into `bin/`) by enabling/disabling them.

### Compile a minimum CLI application

To test compiling a minimum CLI app:

- Replace the entire content of `src/Main.hx` with a minimized `main()` function.
    - Such as: `function main() Sys.println("Hello world!");`
- Comment out all the lines in `hxml/libraries.hxml`.
- Remove unnecessary options for hlc-compiler in the `run-hlc-compiler.bat/command` file.
    - Such as `--runtime` and `-mwindows`


## Misc

### Errors?

If something goes wrong:

- Try `haxe hxml/test-hl-jit.hxml` to test on the HL/JIT target. If it reproduces, perhaps it's not a HL/C issue.
- Check your Haxe version. Playing sound will not work well with Haxe 4.2.4 or 4.2.5.
- See also: <https://github.com/fal-works/hlc-compiler/wiki>

### About the sample resource

- The sample sound (`res/sound.wav`) is from: <https://freesound.org/people/mikepro/sounds/438921/> ( [CC0 License](https://creativecommons.org/publicdomain/zero/1.0/) )
- The sample image (`res/image.png`) is an original one and it's also [CC0 License](https://creativecommons.org/publicdomain/zero/1.0/).
