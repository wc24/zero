package com.xmas.components.core {
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class PanelCore extends Component {
		protected var __content:Sprite;
		protected var _mask:Shape;
		protected var __background:DisplayObject;
		
		//----------------------------------
		//protected var _gridSize:int = 10;
		//protected var _showGrid:Boolean = false;
		//protected var _gridColor:uint = 0xd0d0d0;
		//----------------------------------
		public function PanelCore(width:int = 100, height:int = 100) {
			_width = width;
			_height = height;
			super();
			_mask = new Shape();
			super.addChild(_mask);
			if (!__content) {
				__content = new Sprite();
			}
			if (__background) {
				addSibling(__background)
			}
			super.addChild(__content);
			content.mask = _mask
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				_mask.graphics.clear();
				_mask.graphics.beginFill(0, 0);
				_mask.graphics.drawRect(0, 0, _width, _height);
				_mask.graphics.endFill();
				graphics.clear();
				graphics.beginFill(0, 0);
				graphics.drawRect(0, 0, _width, _height);
				graphics.endFill();
			}
			super.draw();
		}
		
		protected function addSibling(child:DisplayObject):DisplayObject {
			return super.addChild(child);
		}
		
		//----------------override Child------------------
		override public function addChild(child:DisplayObject):DisplayObject {
			return content.addChild(child);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject {
			return content.addChildAt(child, index);
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject {
			return content.removeChild(child);
		}
		
		override public function removeChildAt(index:int):DisplayObject {
			return content.removeChildAt(index);
		}
		
		override public function get numChildren():int {
			return content.numChildren;
		}
		
		override public function removeChildren(beginIndex:int = 0, endIndex:int = 2147483647):void {
			content.removeChildren(beginIndex, endIndex);
		}
		
		override public function getChildAt(index:int):DisplayObject {
			return content.getChildAt(index);
		}
		
		override public function getChildByName(name:String):DisplayObject {
			return content.getChildByName(name);
		}
		
		override public function getChildIndex(child:DisplayObject):int {
			return content.getChildIndex(child);
		}
		
		public function get content():Sprite {
			return __content;
		}
	}
}