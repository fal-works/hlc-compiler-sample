import Cleanup.cleanup;

using Lambda;

private function main() {
	final args = processArgs(Sys.args());
	if (args.clean) {
		Sys.println("---- cleanup ---------");
		cleanup();
		Sys.println("Removed old output.");
	}

	Sys.println("---- Haxe -> HL/C ----");
	haxeToC();

	Sys.println("---- HL/C -> bin -----");
	cToBin();

	if (args.test) {
		Sys.println("---- test ------------");
		runBin();
	}
}

function processArgs(args:Array<String>) {
	final clean = args.remove("--clean") || args.remove("-c");
	final test = args.remove("--test") || args.remove("-t");
	if (args.length > 0)
		Sys.println('WARN: Unknown arguments: ${args.join(" ")}');

	return {clean: clean, test: test};
}

function haxeToC() {
	Sys.println("haxe hxml/build-hl-c.hxml");
	final code = Sys.command("haxe", ["hxml/build-hl-c.hxml"]);
	if (code != 0)
		Sys.exit(code);
}

function cToBin() {
	final code = switch Sys.systemName() {
		case "Windows": Sys.command("run-hlc-compiler.bat");
		case _: Sys.command("./run-hlc-compiler.command");
	}
	if (code != 0)
		Sys.exit(code);
}

function runBin() {
	Sys.println("Running: bin/main");
	Sys.setCwd("bin");
	final code = switch Sys.systemName() {
		case "Windows": Sys.command("main");
		case _: Sys.command("./main");
	}
	Sys.setCwd("../");
	if (code != 0)
		Sys.exit(code);
}
