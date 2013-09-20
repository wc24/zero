package com.xmas.utils {
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class Drager extends EventDispatcher {
		/**
		 * 限制区域
		 */
		public var boundRect:Rectangle;
		private var changeX:Number;
		private var changeY:Number;
		private var area:InteractiveObject;
		private var dragObject:IDragObject;
		private var _stage:Stage;
		private var _boundStage:Boolean;
		private var _mouseX:Number;
		private var _mouseY:Number;
		
		/**
		 * 无缓动的拖动类！
		 */
		public function Drager(dispatcher:IEventDispatcher = null) {
			super(dispatcher);
		}
		
		/**
		 * 开始执行
		 * @param	dragObject 拖动目标
		 * @param	area 拖动区域
		 */
		public function action(dragObject:IDragObject, area:InteractiveObject):void {
			this.dragObject = dragObject;
			this.area = area;
			if (area.stage == null) {
				area.addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			} else {
				area.addEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
				activate()
			}
		}
		
		public function upbound():void {
			dragObject.x = bound(dragObject.x, boundRect.left, boundRect.right);
			dragObject.y = bound(dragObject.y, boundRect.top, boundRect.bottom);
		}
		
		public function get boundStage():Boolean {
			return _boundStage;
		}
		
		public function set boundStage(value:Boolean):void {
			_boundStage = value;
		}
		
		private function this_addedToStage(e:Event):void {
			area.removeEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			area.addEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
			activate()
		}
		
		private function activate():void {
			if (area.stage != null) {
				_stage = area.stage
			} else {
				throw(new XmasError(1)); //
			}
			area.addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDown);
			_stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
			changeX = 0
			changeY = 0
		}
		
		private function stage_mouseUp(e:MouseEvent):void {
			_stage.removeEventListener(Event.ENTER_FRAME, this_mouseMove);
		}
		
		private function this_mouseDown(e:MouseEvent):void {
			changeX = _stage.mouseX;
			changeY = _stage.mouseY;
			_stage.addEventListener(Event.ENTER_FRAME, this_mouseMove);
		}
		
		private function this_mouseMove(e:Event):void {
			_mouseX = boundStage ? bound(_stage.mouseX, 0, _stage.stageWidth) : _stage.mouseX;
			_mouseY = boundStage ? bound(_stage.mouseY, 0, _stage.stageHeight) : _stage.mouseX;
			if (boundRect == null) {
				dragObject.x = dragObject.x + _mouseX - changeX
				dragObject.y = dragObject.y + _mouseY - changeY;
			} else {
				dragObject.x = bound(dragObject.x + _mouseX - changeX, boundRect.left, boundRect.right);
				dragObject.y = bound(dragObject.y + _mouseY - changeY, boundRect.top, boundRect.bottom);
			}
			if (_mouseX != changeX && _mouseY != changeY) {
			}
			changeX = _mouseX;
			changeY = _mouseY;
		}
		
		private function deactivate():void {
			area.removeEventListener(MouseEvent.MOUSE_DOWN, this_mouseDown);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
			_stage = null;
		}
		
		private function this_removedFromStage(e:Event):void {
			area.removeEventListener(Event.REMOVED_FROM_STAGE, this_removedFromStage);
			area.addEventListener(Event.ADDED_TO_STAGE, this_addedToStage);
			deactivate()
		}
	}
}