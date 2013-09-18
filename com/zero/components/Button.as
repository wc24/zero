package com.zero.components {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Button extends Component {
		protected var outColor:uint
		protected var overColor:uint
		protected var enabledColor:uint
		protected var borderColor:uint
		protected var _overSkin:Sprite;
		protected var _outSkin:Sprite;
		protected var _enabledSkin:Sprite;
		protected var _label:Label;
		protected var _labelText:String
		
		public function Button(label:String = "") {
			_labelText = label
			super();
		}
		
		override protected function initConfig():void {
			outColor = 0xCCCCCC;
			overColor = 0xF0F0F0;
			enabledColor = 0xDDDDDD;
			borderColor = 0x666666;
		}
		
		override protected function init():void {
			mouseChildren = false;
			mouseEnabled = true;
			buttonMode = true;
			useHandCursor = true;
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		override public function draw():void {
			_label.text = _labelText;
			_label.draw();
			referSize(_label, 4, 4)
			drawSkin(_overSkin.graphics, overColor, borderColor);
			drawSkin(_outSkin.graphics, outColor, borderColor);
			drawSkin(_enabledSkin.graphics, enabledColor, borderColor);
			super.draw();
		}
		
		override protected function addChildren():void {
			_label = new Label(_labelText);
			_label.move(2, 2)
			_overSkin = new Sprite() // getEmptySkin(Button.overColor, Button.borderColor);
			_outSkin = new Sprite() //getEmptySkin(Button.outColor, Button.borderColor);
			_enabledSkin = new Sprite() // getEmptySkin(Button.enabledColor, Button.borderColor);
			addChild(_overSkin);
			addChild(_outSkin);
			addChild(_enabledSkin);
			addChild(_label);
		}
		
		override public function get enabled():Boolean {
			return super.enabled;
		}
		
		override public function set enabled(value:Boolean):void {
			super.enabled = value;
			_label.enabled = value;
			if (_overSkin) {
				_overSkin.visible = false;
			}
			if (_outSkin) {
				_outSkin.visible = value;
			}
			if (_enabledSkin) {
				_enabledSkin.visible = !value;
			}
		}
		
		private function mouseOver(e:MouseEvent):void {
			if (_overSkin) {
				_overSkin.visible = true;
			}
			if (_outSkin) {
				_outSkin.visible = false;
			}
		}
		
		private function mouseOut(e:MouseEvent):void {
			if (_overSkin) {
				_overSkin.visible = false;
			}
			if (_outSkin) {
				_outSkin.visible = true;
			}
		}
		
		public function set label(value:String):void {
			_labelText = value;
			redraw();
		}
		
		public function get label():String {
			return _labelText
		}
	}
}