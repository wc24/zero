package com.xmas.components.mini {
	import flash.filters.DropShadowFilter;
	import flash.text.Font;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class MiniStyle {
		[Embed(source="assets/pf_ronda_seven.swf",symbol="PF Ronda Seven")]
		public static var Ronda:Class;
		public static var rondaFont:Font = new Ronda()
		static public var fillColor:uint = 0xCCCCCC
		static public var fillOverColor:uint = 0xDDDDDD
		static public var fillEnabledColor:uint = 0xEEEEEE
		static public var borderColor:uint = 0xBBBBBB
		static public var textOverColor:uint = 0x555555
		static public var textColor:uint = 0x222222
		static public var textEnabledColor:uint = 0x888888
		static public var defaultTextFormat:TextFormat = new TextFormat(rondaFont.fontName, 8, textColor);
		static public var dropShadow:uint = 0x222222
		static public var panelBackground:uint = 0xBBBBBB;
		static public var windowBackground:uint = 0xEEEEEE;
		
		public function MiniStyle() {
		}
		
		static public function getShadow(dist:Number, knockout:Boolean = false):DropShadowFilter {
			return new DropShadowFilter(dist, 45, MiniStyle.dropShadow, 1, dist, dist, .3, 1, knockout);
		}
	}
}