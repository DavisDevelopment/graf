package graf.draw;

import tannus.graphics.Color;

import tannus.geom.*;

import graf.draw.StyleChange;
import graf.draw.ContextChange;
import graf.draw.Draw;

/**
  * Enum of the types of Actions which can be taken on a DrawingContext
  */
enum Action {
	/* any change to the styling of the drawing context */
	AStyleChange(change : StyleChange);

	/* any change to the context */
	AContextChange(change : ContextChange);

	/* any action which draws onto the Surface */
	ADraw(d : Draw);
}
