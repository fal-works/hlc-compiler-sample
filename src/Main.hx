/**
	This is an example application to be compiled with HashLink.
**/
class Main extends hxd.App {
	/** Entry point. **/
	static function main() {
		hxd.Res.initLocal();
		new Main();
	}

	/** Objects to be drawn. **/
	final objects:Array<h2d.Object> = [];

	/** Just for holding references. **/
	final refs:Array<Any> = [];

	override function init() {
		initApp();
		initObjects();
		playSound();
		optionals();
	}

	override function update(dt:Float) {
		updateObjects(dt);
	}

	function initApp() {
		final window = hxd.Window.getInstance();
		window.title = "hlc-compiler-sample";
		window.onClose = () -> {
			hxd.snd.Manager.get().dispose();
			return true;
		};
		engine.backgroundColor = 0xFFFEFDFF;
	}

	function initObjects() {
		final tile = hxd.Res.image.toTile().center();
		final image = new h2d.Bitmap(tile, s2d);
		image.setPosition(s2d.width / 2, s2d.height / 2);
		image.alpha = 0;
		objects.push(image);
	}

	function updateObjects(dt:Float) {
		for (image in objects) {
			if (image.alpha < 1)
				image.alpha = Math.min(1, image.alpha + 0.5 * dt); // fade-in effect
		}
	}

	function playSound() {
		hxd.Res.sound.play();
	}

	function optionals() {
		#if USE_UV
		refs.push(new hl.uv.Tcp());
		#end

		#if USE_SSL
		refs.push(new sys.ssl.Socket());
		#end

		#if USE_MYSQL
		refs.push(sys.db.Mysql.connect);
		#end
	}
}
