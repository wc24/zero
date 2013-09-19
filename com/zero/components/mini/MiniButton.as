package com.zero.components.mini {
	import com.zero.components.core.ButtonCore;
	import com.zero.components.core.DrawPart;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniButton extends ButtonCore {
		public function MiniButton(label:String = "") {
			super(label);
		}
		
		override protected function init():void {
			__label = new MiniLabel(_label);
			__label.move(2, 0)
			__overSkin = new Sprite()
			__outSkin = new Sprite()
			__enabledSkin = new Sprite()
		}
		
		override public function draw(drawPart:String):void {
			switch (drawPart) {
				case DrawPart.SIZE: 
					referSize(__label, 4, 0)
					drawSkin(__overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor);
					drawSkin(__outSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor);
					drawSkin(__enabledSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor);
					break;
				default: 
			}
			super.draw(drawPart);
		}
	}
}