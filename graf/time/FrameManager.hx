package graf.time;

/**
  * Base-Class for managing application loops
  */
class FrameManager {
	/* Constructor Function */
	public function new(?f : Void->Void):Void {
		target_fps = 60;
		current_fps = 0;

		do_frame = f;
		running = false;
		paused = false;
		frameTime = 0;
		lastLoopTime = now();
	}

/* === Instance Methods === */

	/**
	  * Wait [ms] milliseconds, then invoke [cb]
	  */
	private function wait(ms:Int, cb:Void->Void):Void {
		throw 'Not implemented!';
	}

	/**
	  * Do the per-frame stuff
	  */
	private function frame():Int {
		var n = now();
		frameTime = (lastLoopTime - n);
		lastLoopTime = n;

		if (do_frame != null) {
			var start = now();
			do_frame();
			var took:Int = (now() - start);
			return took;
		}
		else {
			return 0;
		}
	}

	/**
	  * Schedule a frame
	  */
	private function scheduleFrame():Void {
		frame();

		if (running && !paused) {
			wait(wait_duration, scheduleFrame);
		}
	}

	/**
	  * Start the loop
	  */
	public function start():Void {
		running = true;

		scheduleFrame();
	}

	/**
	  * Permanently stop the loop
	  */
	public function stop():Void {
		running = false;
	}

	/**
	  * Get the current time in milliseconds
	  */
	private inline function now():Int {
		return Std.int(Date.now().getTime());
	}

/* === Computed Instance Fields === */

	/* the best possible frame-duration */
	public var optimal(get, never) : Float;
	private inline function get_optimal() {
		return (1000 / target_fps);
	}

	/* the delay (in milliseconds) */
	private var wait_duration(get, never) : Int;
	private inline function get_wait_duration() {
		return Std.int(1000 / target_fps);
	}

/* === Instance Fields === */

	public var current_fps : Int;
	public var target_fps : Int;

	private var running : Bool;
	private var paused : Bool;
	private var lastLoopTime : Int;
	private var frameTime : Int;
	private var do_frame : Null<Void->Void>;
}
