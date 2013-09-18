package com.zero.components {
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class TextButton extends Label {
		protected var _overColor:uint;
		
		public function TextButton(text:String = "") {
			super(text);
		}
		
		override protected function initConfig():void {
			_overColor = 0x550000;
			_color = 0;
			_enabledColor = 0xcccccc
		}
		
		override protected function init():void {
			buttonMode = true;
			useHandCursor = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		private function mouseOut(e:MouseEvent):void {
			if (enabled) {
				textField.textColor = _color
			}
		}
		
		private function mouseOver(e:MouseEvent):void {
			textField.textColor = _overColor
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			mouseEnabled = value;
			tabEnabled = value;
			super.enabled = value;
		}
	}
}