package com.xmas.components.core {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class BoxCore extends Component {
		
		protected var __content:Sprite;
		protected var __mask:Shape;
		protected var __background:DisplayObject;
		
		public function BoxCore(width:int = 100, height:int = 100) {
			super();
			_width = width;
			_height = height;
			addChild(__background);
			addChild(__content);
			addChild(__mask);
			content.mask = __mask
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				graphics.clear();
				graphics.beginFill(0, 0);
				graphics.drawRect(0, 0, _width, _height);
				graphics.endFill();
			}
			super.draw();
		}
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			super.width = value;
		}
		
		override public function get width():Number {
			return super.width;
		}
		
		override public function set width(value:Number):void {
			super.width = value;
		}
		
		public function get content():Sprite {
			return __content;
		}
		
		public function set content(value:Sprite):void {
			__content = value;
		}
	}

}