package com.zeroserver.core {
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Transceiver extends EventDispatcher {
		protected var _report:IReport;
		protected var _className:String;
		protected var _usage:uint
		protected var _intact:Boolean
		
		public function Transceiver(target:IEventDispatcher) {
			super(target);
			_className = "Transceiver"
		}
		
		public function used():void {
			_usage++;
		}
		
		public function get report():IReport {
			return _report;
		}
		
		public function set report(value:IReport):void {
			_report = value;
		}
		
		public function get usage():uint {
			return _usage;
		}
		
		public function get intact():Boolean {
			return _intact;
		}
		
		override public function toString():String {
			return "[" + _className + " usage=" + _usage + " intact=" + _intact + " report=" + _report + "]";
		}
	}
}