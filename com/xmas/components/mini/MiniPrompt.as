package com.xmas.components.mini {
	import com.xmas.components.core.Component;
	import com.xmas.components.core.DrawPart;
	
	public class MiniPrompt extends MiniWindow {
		private var miniTextbox:MiniTextbox;
		public var submitButton:MiniButton;
		public var closeButton:MiniButton;
		private var _text:String;
		
		public function MiniPrompt(width:int) {
			miniTextbox = new MiniTextbox("", width - 10);
			miniTextbox.move(5, 5)
			closeButton = new MiniButton("X")
			submitButton = new MiniButton("SUBMIT")
			super("", width);
			__titlePanel.addChild(closeButton)
			addChild(miniTextbox)
			addChild(submitButton)
		
		}
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			super.width = value;
			miniTextbox.width = value;
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				_height = miniTextbox.height + 50;
				submitButton.y = _height - 42;
				submitButton.x = width / 2 - submitButton.width / 2;
				closeButton.x = _width - closeButton.width;
			}
			super.draw();
		}
		
		public function get text():String {
			return _text;
		}
		
		public function set text(value:String):void {
			miniTextbox.text = value;
			_text = value;
			redraw(DrawPart.VALUE)
		}
	}
}