class Main extends hxd.App {
	static function main() {
		hxd.Res.initLocal();
		new Main();
	}

	final refs:Array<Any> = [];

	override function init() {
		playSound();
		optionals();
	}

	function playSound() {
		hxd.Res.sound.play();

		hxd.Window.getInstance().onClose = () -> {
			hxd.snd.Manager.get().dispose();
			return true;
		};
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
