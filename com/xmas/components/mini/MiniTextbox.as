package com.xmas.components.mini {
	import com.xmas.components.core.LabelCore;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniTextbox extends LabelCore {
		
		public function MiniTextbox(text:String = "",width=100,height=100) {
			super(text);
			_width = width;
			_height = height;
		
		}
		
		override protected function init():void {
			__autoSize = true;
			__enabledColor = MiniStyle.textEnabledColor
			__textField = new TextField();
			__textField.embedFonts = true;
			__textField.wordWrap = true;
			__textField.defaultTextFormat = MiniStyle.defaultTextFormat;
			__color = int(MiniStyle.defaultTextFormat.color);
		}
	}

}