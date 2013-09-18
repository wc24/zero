package com.zero.mvc {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	[Event(name="add",type="com.zero.mvc.MediatorEvent")]
	[Event(name="remove",type="com.zero.mvc.MediatorEvent")]
	
	public class Mediator extends ZeroCore implements IEventDispatcher {
		public var mediatorId:int;
		private var eventDispatcher:ZeroEventDispatcher;
		public function Mediator() {
			eventDispatcher = new ZeroEventDispatcher(this);
		}
		public function command(event:ZeroEvent):Boolean {
			return zero.command(event);
		}
		/* INTERFACE flash.events.IEventDispatcher */ /* INTERFACE flash.events.IEventDispatcher */
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		public function dispatchEvent(event:Event):Boolean {
			return eventDispatcher.dispatchEvent(event)
		}
		public function hasEventListener(type:String):Boolean {
			return eventDispatcher.hasEventListener(type);
		}
		public function willTrigger(type:String):Boolean {
			return eventDispatcher.willTrigger(type);
		}
	}
}