package com.zero.server.core {
	import flash.events.Event;
	import com.zero.server.Receiver;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ReceiverEvent extends Event {
		static public const RECEIVER:String = "receiver";
		private var _receiver:Receiver;
		
		public function ReceiverEvent(type:String, receiver:Receiver, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			_receiver = receiver;
		}
		
		public function get receiver():Receiver {
			return _receiver;
		}
		
		public function set receiver(value:Receiver):void {
			_receiver = value;
		}
	}
}