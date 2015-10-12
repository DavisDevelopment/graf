package graf.display;

/**
  * Defines the base Surface interface
  */
interface ISurface {
/* === Fields === */

/* === Methods === */

	/* create a new Context */
	function getContext(m : graf.draw.DrawMode):javahx.display.DrawingContext;
}
