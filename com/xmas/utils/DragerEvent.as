package com.xmas.utils {
	import flash.display.InteractiveObject;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class DragerEvent extends MouseEvent {
		public function DragerEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false, localX:Number = null, localY:Number = null, relatedObject:InteractiveObject = null, ctrlKey:Boolean = false, altKey:Boolean = false, shiftKey:Boolean = false, buttonDown:Boolean = false, delta:int = 0) {
			super(type, bubbles, cancelable, localX, localY, relatedObject, ctrlKey, altKey, shiftKey, buttonDown, delta);
		}
	}
}