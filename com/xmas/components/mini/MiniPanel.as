package com.xmas.components.mini {
	import com.xmas.components.core.DrawPart;
	import com.xmas.components.core.PanelCore;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniPanel extends PanelCore {
		private var _background:Shape;
		
		public function MiniPanel(width:int = 100, height:int = 100) {
			super(width, height);
		}
		
		override protected function init():void {
			__content = new Sprite();
			_background = new Shape();
			__background = _background;
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				_background.graphics.clear();
				_background.graphics.beginFill(MiniStyle.panelBackground);
				_background.graphics.drawRect(0, 0, _width, _height);
				_background.graphics.endFill();
			}
			super.draw();
		}
	}
}