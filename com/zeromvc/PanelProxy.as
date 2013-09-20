package com.zeromvc {
	[Event(name="showPanel",type="com.zero.mvc.ProxyEvent")]
	[Event(name="hidePanel",type="com.zero.mvc.ProxyEvent")]
	
	public class PanelProxy extends Proxy {
		protected var _using:Boolean;
		public function PanelProxy(proxyName:String) {
			super(proxyName);
		}
		public function get using():Boolean {
			return _using;
		}
		public function set using(value:Boolean):void {
			if (_using != value) {
				_using = value
				if (_using) {
					dispatchEvent(new ProxyEvent(ProxyEvent.SHOW_PANEL));
				} else {
					dispatchEvent(new ProxyEvent(ProxyEvent.HIDE_PANEL));
				}
			}
		}
	}
}