package graf.draw;

import tannus.graphics.Color;
import tannus.graphics.LinearGradient;

/**
  * Abstract Brush type
  */
abstract Brush (BrushType) from BrushType to BrushType {
	/* Constructor Function */
	public inline function new(bt : BrushType):Void {
		this = bt;
	}

/* === Instance Fields === */

	/* the type of Brush that [this] is */
	public var type(get, never):BrushType;
	private inline function get_type() return this;

/* === Instance Methods === */

	/* cast to Color */
	@:to
	public function toColor():Color {
		switch (this) {
			case Solid(col):
				return col;

			default:
				throw 'BrushError: Not a Color!';
				return new Color();
		}
	}

	/* cast to Gradient */
	@:to
	public function toLGradient():LinearGradient {
		switch (this) {
			case LGradient(lg):
				return lg;

			default:
				throw 'BrushError: Not a Linear Gradient!';
		}
	}

	/* from a Color */
	@:from
	public static inline function fromColor(c : Color):Brush {
		return Solid(c);
	}

	/* from a LinearGradient */
	@:from
	public static inline function fromLinearGradient(lg : LinearGradient):Brush {
		return LGradient(lg);
	}

	/* from a String */
	@:from
	public static inline function fromString(s : String):Brush {
		return Solid(Color.fromString(s));
	}

	/* from an Int */
	@:from
	public static inline function fromInt(i : Int):Brush {
		return Solid(Color.fromInt( i ));
	}
}

enum BrushType {
	/* Solid Color */
	Solid(c : Color);

	/* Linear Gradient */
	LGradient(lg : LinearGradient);
}
