package com.xmas.components.mini {
	import com.xmas.components.core.TextButtonCore;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniTextButton extends TextButtonCore {
		public function MiniTextButton(text:String = "") {
			super(text);
		}
		
		override protected function init():void {
			__enabledColor = MiniStyle.textEnabledColor;
			__overColor = MiniStyle.textOverColor;
			__textField = new TextField();
			__textField.embedFonts = true;
			__textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			__color = int(MiniStyle.defaultTextFormat.color);
			addChild(__textField)
		}
	}
}

