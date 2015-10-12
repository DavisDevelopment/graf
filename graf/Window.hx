package graf;

import graf.IWindow;

@:forward
abstract Window (IWindow) {
	/* Constructor Function */
	public inline function new():Void {
		this = new Impl();
	}

/* === Remapping of counterintuitive field-names === */

	/**
	  * setDimensions => resize
	  */
	public inline function resize(w:Int, h:Int) 
		this.setDimensions(w, h);

	/**
	  * nc_update => update
	  */
	public inline function update()
		this.nc_update();

/* === Type Unification === */

	/* to implementation type */
	@:to
	public inline function _toImpl():Impl {
		return cast this;
	}
}

#if java
	private typedef Impl = javahx.Window;
#else
	#error
#end
