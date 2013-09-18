package com.zero.server.socket {
	import flash.utils.ByteArray;
	import com.zero.server.core.IReport;
	public interface ISocketReport extends IReport {
		function set byteArray(value:ByteArray):void
		function get byteArray():ByteArray
		function get packetSize():uint;
		function set packetSize(value:uint):void;
	}
}