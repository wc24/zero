package com.zero.mvc {
	import flash.events.Event;
	
	/**
	 * 指令
	 */
	public class Command extends ZeroCore {
		/**
		 * 指令数据载体
		 */
		public var event:ZeroEvent;
		/**
		 * 指令类型
		 */
		public var name:String;
		public function Command(name:String = "") {
			this.name = name
		}
		/**
		 * 执行
		 */
		public function execute():void {
		}
		/**
		 * 释放
		 */
		public function dispose():void {
			zero.disposeCommand(this);
		}
		/**
		 * 触发新指令
		 * @param	event 触发指令用到 Event 载体。
		 * @return 如果成功触发指令，则值为 true。值 false 表示失败或对事件调用了 preventDefault()。
		 */
		public function command(event:ZeroEvent):Boolean {
			return zero.command(event)
		}
		public function get data():Object {
			return event.data;
		}
	}
}