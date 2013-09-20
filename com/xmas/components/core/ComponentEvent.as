package com.xmas.components.core {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ComponentEvent extends Event {
		static public const DRAW:String = "draw";
		static public const SELECT:String = "select";
		private var _component:Component;
		private var _value:Number;
		
		public function ComponentEvent(type:String, component:Component, value:Number = 0, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_value = value;
			_component = component;
		}
		
		public function get component():Component {
			return _component;
		}
		
		public function set component(value:Component):void {
			_component = value;
		}
		
		public function get value():Number {
			return _value;
		}
		
		public function set value(value:Number):void {
			_value = value;
		}
		
		override public function toString():String {
			return formatToString("ComponentEvent", "component", "type", "value", "bubbles", "cancelable", "eventPhase");
		}
	}
}