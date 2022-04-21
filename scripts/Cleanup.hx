using sys.FileSystem;

private function main() {
	Sys.println("Cleaning up...");
	cleanup();
	Sys.println("Completed.");
}

function cleanup() {
	deleteDirContents("out");
	deleteDirContents("bin");
}

function deleteDirContents(path:String) {
	if (path.exists() && path.isDirectory()) {
		for (x in path.readDirectory())
			deleteRecursive('$path/$x');
	}
}

function deleteRecursive(path:String) {
	if (!path.isDirectory()) {
		path.deleteFile();
		return;
	}

	for (x in path.readDirectory())
		deleteRecursive('$path/$x');
	path.deleteDirectory();
}
