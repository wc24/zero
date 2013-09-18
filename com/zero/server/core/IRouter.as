package com.zero.server.core {
	
	public interface IRouter {
		//function get command():String;
		//function set command(value:String):void;
		//function get sign():uint;
		//function set sign(value:uint):void;
		//function set argument(value:Array):void;
		//function get argument():Array;
		function get report():IReport;
		function set report(value:IReport):void;
		function get usage():uint;
		function get intact():Boolean;
	}
}