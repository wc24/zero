package com.xmas.components.core {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class LabelCore extends Component {
		protected var __color:uint;
		protected var __enabledColor:uint
		protected var __textField:TextField;
		protected var __autoSize:Boolean;
		protected var _text:String
		
		public function LabelCore(text:String = "") {
			_text = text;
			mouseEnabled = false;
			mouseChildren = false;
			super();
			if (__textField) {
				__textField.selectable = false;
				__textField.autoSize = TextFieldAutoSize.LEFT;
				addChild(__textField)
			}
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			_enabled = value;
			redraw(DrawPart.STATE)
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.VALUE)) {
				__textField.text = _text;
			}
			if (checkPart(DrawPart.COLOR, DrawPart.STATE)) {
				__textField.textColor = _enabled ? __color : __enabledColor;
			}
			if (checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				if (__autoSize) {
					__textField.autoSize = TextFieldAutoSize.LEFT;
					__textField.width = _width;
					referSize(__textField);
				} else {
					__textField.autoSize = TextFieldAutoSize.NONE;
					__textField.width = _width;
					__textField.height = _height;
				}
			}
		}
		
		public function set text(value:String):void {
			_text = value;
			if (_text == null) {
				_text = "";
			}
			redraw(DrawPart.VALUE);
		}
		
		public function get text():String {
			return _text;
		}
		
		/**
		 * 获取内部的TextField实例,可以用来进一步定制它
		 */
		public function get textField():TextField {
			return __textField;
		}
		
		public function get color():uint {
			return __color;
		}
		
		public function set color(value:uint):void {
			__color = value;
			redraw(DrawPart.COLOR);
		}
		
		public function get autoSize():Boolean {
			return __autoSize;
		}
		
		public function set autoSize(value:Boolean):void {
			__autoSize = value;
			redraw(DrawPart.SIZE);
		}
	}
}