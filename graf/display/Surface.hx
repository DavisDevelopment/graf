package graf.display;

import graf.display.ISurface;
import graf.Window;

@:forward
abstract Surface (ISurface) from ISurface {
	public inline function new(w : Window) {
		this = new Impl( w );
	}

/* === Type Unification === */

	/* to implementation type */
	@:to
	public inline function _toImpl():Impl {
		return cast this;
	}
}

#if java
	private typedef Impl = javahx.display.Surface;
#else
	#error
#end
