package graf.draw;

import tannus.graphics.LineCap in Cap;
import tannus.graphics.LineJoin in Join;

import graf.draw.Brush;

/**
  * Enum of all changes which can be made to the styling of a drawing context
  */
enum StyleChange {
	/* Change the Brush */
	Brush(b : Brush);

	/* Change the width of drawn lines */
	LineWidth(w : Float);

	/* Change the way drawn lines are ended */
	LineCap(lc : Cap);

	/* Change the way drawn lines are merged */
	LineJoin(lj : Join);
}
