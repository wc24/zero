package com.zeroserver.socket {
	import com.zero.server.core.IReport;
	import com.zero.server.core.IRouter;
	import com.zero.server.core.IServer;
	
	public interface ISocketServer extends IServer {
		function set packetParse(value:IPacketParse):void;
		
		
		//function set byteArrayParse(value:IByteArrayParse):void;
	}
}