package com.zeroserver.socket {
	import flash.utils.ByteArray;
	import com.zero.server.socket.ISocketReport;
	
	public class SocketReport implements ISocketReport {
		private var _command:String;
		private var _argument:Object;
		private var _byteArray:ByteArray;
		private var _sign:uint;
		private var _packetSize:uint;
		protected var _className:String;
		
		public function SocketReport() {
			_className = "SocketReport"
		}
		
		public function toString():String {
			return "[" + _className + " command=\"" + _command + "\" sign=" + _sign + " packetSize=" + _packetSize + " argument=" + JSON.stringify(_argument) + "]" + " byteArray=" + byteArrayToString(_byteArray);
		}
		
		public function byteArrayToString(byteArray:ByteArray):String {
			if (byteArray != null) {
				var bytes:String = ""
				byteArray.position = 0;
				if (byteArray.length > 200) {
					byteArray.position = byteArray.length - 20
					bytes = ".. .. "
				} else {
					byteArray.position = 0
				}
				while (byteArray.position < byteArray.length) {
					bytes += repair(byteArray.readByte().toString(16), 2) + " ";
				}
				byteArray.position = 0;
				return "[ByteArray length=" + byteArray.length + " bytes=" + bytes + "]"
			} else {
				return "null"
			}
		}
		
		private function repair(value:String, long:int):String {
			for (var i:int = 0; i < long - value.length; i++) {
				value = "0" + value;
			}
			return value
		}
		
		public function set byteArray(value:ByteArray):void {
			_byteArray = value;
		}
		
		public function get byteArray():ByteArray {
			return _byteArray;
		}
		
		public function get sign():uint {
			return _sign;
		}
		
		public function set sign(value:uint):void {
			_sign = value;
		}
		
		public function get packetSize():uint {
			return _packetSize;
		}
		
		public function set packetSize(value:uint):void {
			_packetSize = value;
		}
		
		public function get command():String {
			return _command;
		}
		
		public function set command(value:String):void {
			_command = value;
		}
		
		public function set argument(value:Object):void {
			_argument = value;
		}
		
		public function get argument():Object {
			return _argument;
		}
	}
}