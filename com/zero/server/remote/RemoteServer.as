package com.zero.server.remote {
	import flash.events.AsyncErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import router.core.IRemoteServer;
	
	public class RemoteServer extends NetConnection implements IRemoteServer {
		private var _timeout:int;
		//private var _remoteParse:IRemoteParse;
		public function RemoteServer() {
			this.objectEncoding = ObjectEncoding.AMF3;
			addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHd);
			addEventListener(IOErrorEvent.IO_ERROR, ioErrorHd);
			addEventListener(NetStatusEvent.NET_STATUS, netStatusHd);
			addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHd);
			_timeout = 20000;
		}
		//public function faultFunction(value:Object):void {
		//sendError(ErrorCode.REMOTE_FAULT, this); //可能是调用函数不存在或者参数类型不对
		//}
		/* INTERFACE router.core.IServer */
		public function get timeout():uint {
			return _timeout;
		}
		public function set timeout(value:uint):void {
			_timeout = value;
		}
		public function send(router:IRouter):void {
			//checkParse()
			//remoteServer.call.apply(null, _remoteParse.coding(router));
		}
	}
}