package com.xmas.components.core {
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	[Event(name="draw",type="com.xmas.components.core.ComponentEvent")]
	public class Component extends Sprite {
		protected var _width:int;
		protected var _height:int;
		protected var _tag:int = -1;
		protected var _enabled:Boolean = true;
		protected var drawPartPool:Object = new Object();
		//public static const drawPartName:Array = [DrawPart.STATE, DrawPart.VALUE, DrawPart.SIZE, DrawPart.COLOR, DrawPart.ENABLED, DrawPart.POSITION]
		public function Component() {
			init();
			redraw()
			enabled = true;
		}
		/**
		 * 用于子类覆盖实现初始化组件
		 */
		protected function init():void {
		}
		//--------------------------------------------------protected methods
		/**
		 * 标记下一帧需要重绘组件
		 */
		protected function redraw(part:String = "all"):void {
			drawPartPool[part] = true;
			addEventListener(Event.EXIT_FRAME, onRedraw);
		}
		protected function referSize(displayObject:DisplayObject, width:int = 0, height:int = 0):void {
			_width = (displayObject.width >> 0) + width;
			_height = (displayObject.height >> 0) + height;
		}
		/**
		 * 快速画图
		 */
		protected function drawSkin(graphics:Graphics, fill:uint, line:uint):void {
			graphics.clear()
			graphics.lineStyle(1, line);
			graphics.beginFill(fill, 1);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
		protected function tryAddChild(child:DisplayObject):void {
			if (child != null) {
				addChild(child);
			}
		}
		//--------------------------------------------------public methods
		/**
		 * 本组件系统希望能在不缩放的舞台的上显示.
		 */
		public static function initStage(stage:Stage):void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		/**
		 * 移动组件到指定位置.
		 * @param	x
		 * @param	y
		 */
		public function move(x:Number, y:Number):void {
			this.x = x >> 0;
			this.y = y >> 0;
		}
		/**
		 * 设置组件尺寸大小.
		 * @param	width
		 * @param	height
		 */
		public function setSize(width:int, height:int):void {
			_width = width;
			_height = height;
			redraw(DrawPart.SIZE);
		}
		/**
		 * 按部件绘图
		 */
		public function deletePart(... arg:Array):Boolean {
			var bool:Boolean = drawPartPool[DrawPart.ALL];
			for each (var item:String in arg) {
				bool = bool || drawPartPool[item]
				delete drawPartPool[item];
			}
			return bool
		}
		public function checkPart(... arg:Array):Boolean {
			var bool:Boolean = drawPartPool[DrawPart.ALL];
			for each (var item:String in arg) {
				if (bool) {
					return bool
				} else {
					bool = drawPartPool[item]
				}
			}
			return bool
		}
		/**
		 * 抽象部位绘图,用于子类覆盖实现.
		 */
		public function draw():void {
		}
		//--------------------------------------------------event handlers
		/**
		 * 进入下一帧进行重绘组件
		 */
		protected function onRedraw(event:Event):void {
			draw();
			removeEventListener(Event.EXIT_FRAME, onRedraw);
			dispatchEvent(new ComponentEvent(ComponentEvent.DRAW, this));
			drawPartPool = new Object();
		}
		//--------------------------------------------------getter/setters
		/**
		 * 设置/获取 组件宽度
		 */
		override public function set width(width:Number):void {
			_width = width >> 0;
			redraw(DrawPart.SIZE);
		}
		override public function get width():Number {
			return _width;
		}
		/**
		 *设置/获取 组件高度
		 */
		override public function set height(height:Number):void {
			_height = height >> 0;
			redraw(DrawPart.SIZE);
		}
		override public function get height():Number {
			return _height;
		}
		/**
		 * 设置/获取 组件标识号
		 */
		public function set tag(value:int):void {
			_tag = value;
		}
		public function get tag():int {
			return _tag;
		}
		/**
		 * 设置 组件x轴整象素坐标
		 */
		override public function set x(value:Number):void {
			super.x = value >> 0
		}
		/**
		 * 设置 组件y轴整象素坐标
		 */
		override public function set y(value:Number):void {
			super.y = Math.round(value);
		}
		/**
		 * 设置/获取 组件是否可用;
		 */
		public function set enabled(value:Boolean):void {
			_enabled = value;
			mouseEnabled = _enabled;
			tabEnabled = value;
			redraw(DrawPart.STATE);
		}
		public function get enabled():Boolean {
			return _enabled;
		}
		/**
		 * 获取 内容宽度;
		 */
		public function get contentWidth():Number {
			return super.width
		}
		/**
		 * 获取 内容高度;
		 */
		public function get contentHeight():Number {
			return super.height
		}
	}
}