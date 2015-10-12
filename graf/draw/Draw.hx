package graf.draw;

import tannus.geom.*;

/**
  * Enum of all "drawing actions"
  */
enum Draw {
	/* draw a line */
	DLine(line : Line);

	/* draw an arc */
	DArc(arc : Arc);

	/* draw a rectangle */
	DRect(r : Rectangle);

	/* draw a polygon */
	DPolygon(shape : Polygon);

	/* draw a sequence of connected lines */
	DPolyline(lines : Array<Point>);
}
