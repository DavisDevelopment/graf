package graf;

import graf.events.Event;
import graf.events.EventQueue;

import graf.display.Surface;

import tannus.geom.Rectangle;

/**
  * Defines the interface that implementations of graf.Window must adhere to
  */
interface IWindow {
/* === Methods === */

	/* set the size of the Window */
	function setDimensions(w:Int, h:Int):Void;

	/* obtain a list of all pending Events */
	function events():Array<Event>;

	/* update [this] Window */
	function nc_update():Void;

/* === Fields === */

	var width(get, never) : Int;
	var height(get, never) : Int;
	var rect(get, never) : Rectangle;

	var screen : Surface;
}
