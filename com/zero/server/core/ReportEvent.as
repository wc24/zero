package com.zero.server.core {
	import flash.events.Event;
	
	public class ReportEvent extends Event {
		private var _report:IReport;
		public static const REPORT:String = "report";
		static public const CONNECT_FAILED:String = "connectFailed";
		
		public function ReportEvent(type:String, report:IReport) {
			super(type);
			_report = report;
		}
		
		public function get report():IReport {
			return _report;
		}
		
		public function set report(value:IReport):void {
			_report = value;
		}
		
		override public function toString():String {
			return formatToString("ReportEvent", "type", "bubbles", "cancelable", "eventPhase", "report"); 
		}
	}
}