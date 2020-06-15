class Main extends hxd.App {
	static function main()
		new Main();

	override function init() {
		playSound();
		optionals();
	}

	function playSound() {
		hxd.Res.initLocal();
		hxd.Res.sound.play();

		hxd.Window.getInstance().onClose = () -> {
			hxd.snd.Manager.get().dispose();
			return true;
		};
	}

	function optionals() {
		#if TEST_UV
		new hl.uv.Tcp();
		#end

		#if TEST_SSL
		new sys.ssl.Socket();
		#end

		#if TEST_MYSQL
		final connectMysql = sys.db.Mysql.connect;
		#end
	}
}
