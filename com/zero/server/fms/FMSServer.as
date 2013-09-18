package com.zero.server.fms {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.Socket;
	import com.zero.server.core.IRouter;
	import com.zero.server.core.IServer;
	/**
	 * ...
	 * @author 蓝面包
	 */
	//[Event(name="report",type="router.core.ReportEvent")]
	//[Event(name="connect",type="flash.events.Event")]
	
	public class FMSServer extends NetConnection implements IServer {
		private var _timeout:int;
		public function FMSServer() {
			super();
			_timeout = 20000;
			//addEventListener(ReportEvent.REPORT, rePortHd);
			addEventListener(NetStatusEvent.NET_STATUS, netStatusHd);
			client = new FMSClinet(this)
			//var dd:Socket
			//dd.addEventListener(IOErrorEvent.IO_ERROR
		}
		//private function rePortHd(e:ReportEvent):void {
		//trace(e.report.command, e.report.argument)
		//}
		private function netStatusHd(e:NetStatusEvent):void {
			trace(e, e.info.code);
			switch (e.info.code) {
				case "NetConnection.Connect.Success": 
					dispatchEvent(new Event(Event.CONNECT))
					//_islink=true
					//_netConnect.client = ClientObj();
					break;
				case "NetConnection.Connect.Failed": 
					//dispatchEvent(new ReportEvent(ReportEvent.CONNECT_FAILED))
					//showMessage("\n\n无法连接服务器");
					break;
				case "NetConnection.Connect.Rejected": 
					//dispatchEvent(new ReportEvent(ReportEvent.CONNECT_FAILED))
					//if (!_islink)
					//{
					//showMessage(e.info.application.message);//reject连接
					//}
					break;
				case "NetConnection.Connect.Closed": 
					dispatchEvent(new Event(Event.CLOSE))
					//if (_islink)
					//{
					//_islink=false
					//showMessage("\n\n服务器端应用程序已经关闭");
					//}
					//
					break;
				case "NetConnection.Connect.AppShutDown": 
					//dispatchEvent(new ReportEvent(ReportEvent.CONNECT_FAILED))
					//showMessage("\n\n服务器端应用程序已经关闭(由于资源耗用过大等原因)或者服务器已经关闭！");
					break;
				case "NetConnection.Connect.InvalidApp": 
					//dispatchEvent(new ReportEvent(ReportEvent.CONNECT_FAILED))
					//showMessage("\n\n指定的应用程序名称没有找到");
					break;
			}
		}
		/* INTERFACE router.core.IServer */
		public function get timeout():uint {
			return _timeout;
		}
		public function set timeout(value:uint):void {
			_timeout = value;
		}
		public function send(router:IRouter):void {
			//call(serverFun, null, serverData);
			//var args:Array = [router.command, null];
			//args.concat(router.argument)
			call.apply(null, [router.report.command, null].concat(router.report.argument));
		}
	}
}