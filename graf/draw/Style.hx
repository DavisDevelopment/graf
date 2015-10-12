package graf.draw;

import graf.draw.Brush;

import tannus.graphics.LineCap;
import tannus.graphics.LineJoin;

class Style {
	/* Constructor Function */
	public function new():Void {
		brush = '#000000';

		lineWidth = 1;
		lineCap = Butt;
		lineJoin = Miter;
	}

/* === Instance Fields === */

	public var brush : Brush;
	
	public var lineWidth : Float;
	public var lineCap : LineCap;
	public var lineJoin : LineJoin;
}
