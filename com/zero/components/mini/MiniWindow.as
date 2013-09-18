package com.zero.components.mini {
	import com.zero.components.core.DrawPart;
	import com.zero.components.core.WindowCore;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniWindow extends WindowCore {
		private var _background:Shape;
		
		public function MiniWindow(title:String = "", width:int = 100, height:int = 100) {
			super(title, width, height);
		}
		
		override protected function init():void {
			__titleLabel = new MiniLabel(_title)
			__titlePanel = new MiniPanel(_width, 20);
			_background = new Shape();
			addChild(_background)
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				_background.graphics.clear();
				_background.graphics.beginFill(MiniStyle.windowBackground);
				_background.graphics.drawRect(0, 0, _width, _height);
				_background.graphics.endFill();
			}
			super.draw();
		}
	}
}