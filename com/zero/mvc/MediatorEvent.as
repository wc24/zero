package com.zero.mvc {
	import flash.events.Event;
	
	public class MediatorEvent extends Event {
		static public const ADD:String = "add";
		static public const REMOVE:String = "remove";
		public function MediatorEvent(type:String) {
			super(type)
		}
	}
}