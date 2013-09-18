package com.zero.components.core {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class WindowCore extends Component {
		//protected var __minimizeButton:ButtonCore;
		//protected var __closeButton:ButtonCore;
		//protected var __background:DisplayObject
		protected var __titleLabel:LabelCore;
		protected var __titlePanel:PanelCore
		protected var _title:String;
		protected var _draggable:Boolean = true;
		
		public function WindowCore(title:String = "", width:int = 100, height:int = 100) {
			_title = title;
			_width = width;
			_height = height;
			super();
			if (__titlePanel == null) {
				__titlePanel = new PanelCore(width, height)
			}
			if (__titleLabel != null) {
				__titlePanel.addChild(__titleLabel)
			}
			addChild(__titlePanel)
			__titlePanel.addEventListener(MouseEvent.MOUSE_DOWN, titlePanel_mouseDown);
		}
		
		private function titlePanel_mouseDown(e:Event):void {
			if (_draggable) {
				this.startDrag();
				stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
				parent.addChild(this); // move to top
			}
			dispatchEvent(new ComponentEvent(ComponentEvent.SELECT, this));
		}
		
		private function stage_mouseUp(e:Event):void {
			this.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUp);
		}
		
		override public function draw():void {
			if (checkPart(DrawPart.SIZE)) {
				__titleLabel.x = width / 2 - __titleLabel.width / 2;
			}
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
			redraw(DrawPart.SIZE)
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