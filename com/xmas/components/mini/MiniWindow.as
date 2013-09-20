package com.xmas.components.mini {
	import com.xmas.components.core.DrawPart;
	import com.xmas.components.core.WindowCore;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniWindow extends WindowCore {
		public var _background:Shape;
		
		public function MiniWindow(title:String = "", width:int = 100, height:int = 100) {
			super(title, width, height);
		}
		
		override protected function init():void {
			__titleLabel = new MiniLabel(_title)
			__titlePanel = new MiniPanel(_width, 20);
			__content = new Sprite();
			__content.y = 20;
			_background = new Shape();
			__background = _background;
		
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				_background.graphics.clear();
				_background.graphics.beginFill(0, 0.2);
				_background.graphics.drawRect(0, 0, _width, _height);
				_background.graphics.endFill();
				__titleLabel.x = width / 2 - __titleLabel.width / 2;
			}
			if (checkPart(DrawPart.VALUE)) {
				__titleLabel.x = width / 2 - __titleLabel.width / 2;
			}
			super.draw();
		}
	}
}