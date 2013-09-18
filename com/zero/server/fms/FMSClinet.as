package com.zero.server.fms {
	import flash.utils.flash_proxy;
	import flash.utils.Proxy;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	dynamic internal class FMSClinet extends Proxy {
		private var server:FMSServer;
		private var name:String;
		public function FMSClinet(server:FMSServer) {
			this.server = server;
		}
		override flash_proxy function callProperty(name:*, ... rest):* {
		}
		override flash_proxy function getProperty(name:*):* {
			this.name = name;
			return callFunction as Function
		}
		private function callFunction(... rest):void {
			var report:Report = new Report(name)
			report.argument = rest;
			server.dispatchEvent(new ReportEvent(ReportEvent.REPORT, report));
		}
		override flash_proxy function setProperty(name:*, value:*):void {
		}
	}
}