package com.xmas.components.core {
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class TextButtonCore extends LabelCore {
		protected var __overColor:uint;
		protected var _isOver:Boolean
		
		public function TextButtonCore(text:String = "") {
			super(text);
			buttonMode = true;
			useHandCursor = true;
			__autoSize = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		private function mouseOut(e:MouseEvent):void {
			_isOver = false;
			redraw(DrawPart.STATE);
		}
		
		private function mouseOver(e:MouseEvent):void {
			_isOver = true;
			redraw(DrawPart.STATE);
		}
		
		override public function draw():void {
			if (deletePart(DrawPart.COLOR, DrawPart.ENABLED, DrawPart.STATE)) {
				__textField.textColor = _enabled ? (_isOver ? __overColor : __color) : __enabledColor;
			}
			super.draw();
		}
		
		override public function get enabled():Boolean {
			return _enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			mouseEnabled = value;
			tabEnabled = value;
			_enabled = value;
			redraw(DrawPart.ENABLED);
		}
	}
}