package com.zero.server {
	import com.zero.server.core.IReport;
	import com.zero.server.core.IRouter;
	import com.zero.server.core.IServer;
	import com.zero.server.core.ReceiverEvent;
	import com.zero.server.core.ReportEvent;
	import com.zero.server.core.Transceiver;
	[Event(name="receiver",type="com.zero.server.core.ReceiverEvent")]
	
	public class Receiver extends Transceiver implements IRouter {
		private var _server:IServer;
		private var _command:String;
		private var _sign:int;
		
		public function Receiver(server:IServer, command:String, sign:int = 0) {
			super(_server)
			_sign = sign;
			_className = "Receiver"
			_command = command;
			_server = server;
			_server.addEventListener(ReportEvent.REPORT, server_report);
		}
		
		private function server_report(e:ReportEvent):void {
			var report:IReport = e.report
			if (report.command == _command && report.sign == _sign) {
				used();
				receive(report)
			}
		}
		
		public function receive(report:IReport):void {
			this.report = report;
			dispatchEvent(new ReceiverEvent(ReceiverEvent.RECEIVER, this));
		}
		
		public function get server():IServer {
			return _server;
		}
	}
}