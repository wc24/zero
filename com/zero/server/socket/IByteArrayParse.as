package com.zero.server.socket {
	import com.zero.server.Receiver;
	import com.zero.server.Sender;
	
	public interface IByteArrayParse {
		function encode(sender:Sender):void;
		function decode(receiver:Receiver):void;
	}
}