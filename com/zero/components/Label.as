package com.zero.components {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Label extends Component {
		protected var _fontName:String=null;
		protected var _fontSize:uint=12;
		protected var _color:uint=0x666666;
		protected var _enabledColor:uint=0x999999;
		protected var _autoSize:Boolean=true;
		protected var _text:String="";
		protected var _textField:TextField;
		protected var _defaultTextFormat:TextFormat;
		
		public function Label(text:String = "") {
			_text = text;
			super();
		}
		override protected function init():void {
			mouseEnabled = false;
			mouseChildren = false;
		}
		
		override protected function addChildren():void {
			_textField = new TextField();
			_textField.selectable = false;
			_textField.mouseEnabled = false;
			_defaultTextFormat = new TextFormat(_fontName, _fontSize, _color);
			_textField.defaultTextFormat = _defaultTextFormat;
			addChild(_textField);
		}
		
		override public function draw():void {
			_textField.text = _text;
			if (_autoSize) {
				_textField.autoSize = TextFieldAutoSize.LEFT;
			} else {
				_textField.autoSize = TextFieldAutoSize.NONE;
			}
			referSize(_textField)
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			_enabled = value;
			textField.textColor = value ? _color : _enabledColor;
		}
		
		/**
		 * 设置/获取Label的文本信息
		 */
		public function set text(value:String):void {
			_text = value;
			if (_text == null) {
				_text = "";
			}
			redraw();
		}
		
		public function get text():String {
			return _text;
		}
		
		/**
		 * 设置/获取Label的自动匹配大小
		 */
		public function set autoSize(value:Boolean):void {
			_autoSize = value;
		}
		
		public function get autoSize():Boolean {
			return _autoSize;
		}
		
		/**
		 * 获取内部的TextField实例,可以用来进一步定制它
		 */
		public function get textField():TextField {
			return _textField;
		}
	}
}