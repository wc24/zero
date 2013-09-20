package com.zeroserver.core {
	import flash.utils.ByteArray;
	import com.zero.server.fms.IFmsReport;
	import com.zero.server.remote.IRemoteReport;
	import com.zero.server.socket.ISocketReport;
	
	public class AllReport implements ISocketReport, IRemoteReport, IFmsReport {
		private var _command:String;
		private var _argument:Array;
		private var _byteArray:ByteArray;
		private var _sign:uint;
		private var _packetSize:uint;
		protected var _className:String;
		
		public function AllReport() {
			_className = "AllReport"
		}
		
		public function toString():String {
			return "[" + _className + " command=\"" + _command + "\" sign=" + _sign + " packetSize=" + _packetSize + " byteArray=" + byteArrayToString(_byteArray) + " argument=" + JSON.stringify(_argument) + "]";
		}
		
		public function byteArrayToString(byteArray:ByteArray):String {
			if (byteArray != null) {
				var bytes:String = ""
				byteArray.position = 0
				for (var i:int = 0; i < byteArray.length; i++) {
					bytes += repair(byteArray.readUnsignedByte().toString(16), 2) + " ";
				}
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
		
		public function set argument(value:Array):void {
			_argument = value;
		}
		
		public function get argument():Array {
			return _argument;
		}
	}
}