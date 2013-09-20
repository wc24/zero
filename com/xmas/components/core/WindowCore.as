package com.xmas.components.core {
	import com.xmas.utils.bound;
	import com.xmas.utils.Drager;
	import com.xmas.utils.IDragObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class WindowCore extends PanelCore implements IDragObject {
		//protected var __minimizeButton:ButtonCore;
		//protected var __closeButton:ButtonCore;
		//protected var __background:DisplayObject
		protected var __titleLabel:LabelCore;
		protected var __titlePanel:PanelCore
		protected var _title:String;
		protected var _draggable:Boolean = true;
		protected var _drager:Drager;
		public function WindowCore(title:String = "", width:int = 100, height:int = 100) {
			_title = title;
			_width = width;
			_height = height;
			//
			super(_width,_height);
			if (__titlePanel == null) {
				__titlePanel = new PanelCore(width, height)
			}
			if (__titleLabel != null) {
				__titlePanel.addChild(__titleLabel)
			}
			addSibling(__content);
			addSibling(__titlePanel)
			_drager = new Drager()
			_drager.action(this, __titlePanel);
			_drager.boundStage = true;
			__titlePanel.addEventListener(MouseEvent.MOUSE_DOWN, titlePanel_mouseDown);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		private function addedToStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.addEventListener(Event.RESIZE, resize);
		}
		private function resize(e:Event):void {
			x = bound(x, 0, stage.stageWidth - _width);
			y = bound(y, 0, stage.stageHeight - _height);
		}
		private function removedFromStage(e:Event):void {
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			stage.removeEventListener(Event.RESIZE, resize);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		private function titlePanel_mouseDown(e:Event):void {
			parent.addChild(this); // move to top
			dispatchEvent(new ComponentEvent(ComponentEvent.SELECT, this));
		}
		override public function get width():Number {
			return super.width;
		}
		override public function set width(value:Number):void {
			super.width = value;
			__titlePanel.width = value;
		}
		public function get title():String {
			return _title;
		}
		public function set title(value:String):void {
			_title = value;
			__titleLabel.text = _title;
			redraw(DrawPart.VALUE)
		}
		public function get draggable():Boolean {
			return _draggable;
		}
		public function set draggable(value:Boolean):void {
			_draggable = value;
			__titlePanel.buttonMode = _draggable;
			__titlePanel.useHandCursor = _draggable;
		}
	}
}