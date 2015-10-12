package graf.events;

import tannus.geom.*;

/**
  * Enum of all possible Event types in Graf
  */
enum Event {
	/* Window is being closed */
	WindowClose;

	/* Window is being resized */
	WindowResize(area : Area);

	/* Object is being moved */
	WindowMove(newpos : Point);

	/* Object is being hidden */
	Hide;

	/* Object is being shown */
	Show;
}
