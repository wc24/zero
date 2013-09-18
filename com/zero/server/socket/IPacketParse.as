package com.zero.server.socket {
	import flash.net.Socket;
	
	public interface IPacketParse {
		function get packetHeadSize():uint;
		function encode(socket:Socket, report:ISocketReport):void;
		function decode(socket:Socket, report:ISocketReport):void;
	}
}