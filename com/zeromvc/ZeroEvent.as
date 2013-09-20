package com.zeromvc {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ZeroEvent extends Event {
		public var data:Object;
		static public const STARTUP:String = "startup";
		static public const RESIZE:String = "resize";
		public function ZeroEvent(type:String, data:Object = null) {
			super(type)
			this.data = data;
		}
	}
}