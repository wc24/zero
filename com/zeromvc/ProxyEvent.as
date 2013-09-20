package com.zeromvc {
	import flash.events.Event;
	
	public class ProxyEvent extends Event {
		static public const ADD:String = "add";
		static public const REMOVE:String = "remove";
		static public const UPDATA:String = "updata";
		static public const HIDE_PANEL:String = "hidePanel";
		static public const SHOW_PANEL:String = "showPanel";
		
		public function ProxyEvent(type:String) {
			super(type)
		}
	}
}