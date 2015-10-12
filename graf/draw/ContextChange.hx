package graf.draw;

import tannus.geom.Rectangle;

/**
  * Enum of all changes which can be made to the drawing context
  */
enum ContextChange {
	/* Change the clipping rectangle */
	Clip(rect : Rectangle);

	/* perform a coordinate translation */
	Translate(x:Float, y:Float);

	/* perform a coordinate rotation */
	Rotate;
}
