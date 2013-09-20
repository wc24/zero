package com.xmas.components.mini {
	import com.xmas.components.core.ButtonCore;
	import com.xmas.components.core.DrawPart;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniButton extends ButtonCore {
		private var _overSkin:Sprite;
		private var _outSkin:Sprite;
		private var _enabledSkin:Sprite;
		
		public function MiniButton(label:String = "") {
			super(label);
		}
		
		override protected function init():void {
			__labelCore = new MiniLabel(_label);
			__labelCore.move(2, 0)
			_overSkin = new Sprite()
			_outSkin = new Sprite()
			_enabledSkin = new Sprite()
			__overSkin = _overSkin;
			__outSkin = _outSkin;
			__enabledSkin = _enabledSkin;
		
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.VALUE)) {
				referSize(__labelCore,4,0);
			}
			if (checkPart(DrawPart.VALUE, DrawPart.SIZE)) {
				drawSkin(_overSkin.graphics, MiniStyle.fillOverColor, MiniStyle.borderColor);
				drawSkin(_outSkin.graphics, MiniStyle.fillColor, MiniStyle.borderColor);
				drawSkin(_enabledSkin.graphics, MiniStyle.fillEnabledColor, MiniStyle.borderColor);
			}
		}
	}
}