package com.zeroserver.core {
	public interface IReport {
		function get command():String;
		function set command(value:String):void;
		function set argument(value:Object):void;
		function get argument():Object;
		function get sign():uint;
		function set sign(value:uint):void;
	}
}