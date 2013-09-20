package com.xmas.components.core {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ButtonCore extends Component {
		protected var _label:String;
		protected var _isOver:Boolean
		protected var __overSkin:DisplayObject;
		protected var __outSkin:DisplayObject;
		protected var __enabledSkin:DisplayObject;
		protected var __labelCore:LabelCore;
		
		public function ButtonCore(label:String = "") {
			_label = label;
			super()
			mouseChildren = false;
			mouseEnabled = true;
			buttonMode = true;
			useHandCursor = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			tryAddChild(__enabledSkin)
			tryAddChild(__outSkin)
			tryAddChild(__overSkin)
			tryAddChild(__labelCore)
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.STATE)) {
				if (__outSkin) {
					__outSkin.visible = (_enabled || __enabledSkin == null) && (!_isOver || __overSkin == null);
				}
				if (__overSkin) {
					__overSkin.visible = _enabled && _isOver;
				}
				if (__enabledSkin) {
					__enabledSkin.visible = !_enabled;
				}
			}
		}
		
		private function mouseOut(e:MouseEvent):void {
			_isOver = false;
			redraw(DrawPart.STATE);
		}
		
		private function mouseOver(e:MouseEvent):void {
			_isOver = true;
			redraw(DrawPart.STATE);
		}
		
		public function get labelCore():LabelCore {
			return __labelCore;
		}
		
		public function set labelCore(value:LabelCore):void {
			__labelCore = value;
		}
		
		public function get label():String {
			return _label;
		}
		
		public function set label(value:String):void {
			__labelCore.text = value;
			_label = value;
			redraw(DrawPart.VALUE);
		}
	}
}