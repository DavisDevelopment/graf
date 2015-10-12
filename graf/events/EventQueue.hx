package graf.events;

import haxe.macro.Expr;
import haxe.macro.Context;

import graf.events.Event;

using Lambda;
using tannus.ds.ArrayTools;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;

/**
  * Container for Events to be stored in, and then processed in a batch
  */
class EventQueue {
	/* Constructor Function */
	public function new():Void {
		q = new Array();
	}

/* === Instance Methods === */

	/**
	  * Add an Event onto the Queue
	  */
	public inline function push(e : Event):Void {
		q.push(e);
	}

	/**
	  * Remove the last Event from [this] Queue
	  */
	public inline function pop():Null<Event> {
		return q.pop();
	}

	/**
	  * Remove the last Event of type [t] from [this] Queue
	  */
	public macro function popType(self:ExprOf<EventQueue>, t:Expr):ExprOf<Null<Event>> {
		var e = Context.getType('graf.events.Event').getEnum();
		var name:String = (t.toString());
		if (e.constructs.exists(name)) {
			return macro ($self._popType($v{name}));
		}
		else {
			Context.error('TypeError: graf.events.Event has no construct named "$name"!', Context.currentPos());
		}
	}

	/**
	  * Method underlying 'popType'
	  */
	private function _popType(name : String):Null<Event> {
		var res:Null<Event> = null;
		for (e in q) {
			if (e.getName() == name) {
				res = e;
			}
		}
		if (res != null) {
			q.remove(res);
		}
		return res;
	}

	/**
	  * Return all Queued Events, and reset [q]
	  */
	public function flush():Array<Event> {
		var res = q.copy();
		q = new Array();
		return res;
	}

/* === Instance Fields === */

	/* Array to store Event instances in */
	private var q : Array<Event>;
}
