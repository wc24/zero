package com.zeromvc {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ZeroEventDispatcher implements IEventDispatcher {
		private var eventDispatcher:EventDispatcher;
		public function ZeroEventDispatcher(target:IEventDispatcher = null) {
			eventDispatcher = new EventDispatcher(target);
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