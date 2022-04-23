/**
	Options:
	- `jit`
**/
function main() {
	final args = Sys.args();
	final jit = args.remove("jit");
	if (args.length > 0)
		Sys.println('WARN: Unknown arguments: ${args.join(" ")}');

	final code = if (jit) testJit() else testBin();
	if (code != 0)
		Sys.exit(code);
}

function testJit() {
	return Sys.command("haxe", ["hxml/test-hl-jit.hxml"]);
}

function testBin() {
	final exePath = switch Sys.systemName() {
		case "Windows": "bin\\main";
		case _: "bin/main";
	}
	Sys.println('Running: $exePath');
	return Sys.command(exePath);
}
