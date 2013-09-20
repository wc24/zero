package com.xmas.components.mini {
	import com.xmas.components.core.LabelCore;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniLabel extends LabelCore {
		public function MiniLabel(text:String = "") {
			super(text);
		}
		
		override protected function init():void {
			__autoSize = true;
			__enabledColor = MiniStyle.textEnabledColor
			__textField = new TextField();
			__textField.embedFonts = true;
			__textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			__color = int(MiniStyle.defaultTextFormat.color);
		}
	}
}