package com.zero.components.core {
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ComponentError extends Error {
		private static var pool:Vector.<String> = initPool
		public static const length:int = pool.length;
		public function ComponentError(errorID:uint) {
			trace(errorID)
			if (errorID < length) {
				super(pool[errorID], errorID);
			} else {
				throw(new ComponentError(0))
			}
		}
		static private function get initPool():Vector.<String> {
			var _pool:Vector.<String> = new Vector.<String>();
			_pool.push("使用了错误的\"errorID\"")
			_pool.push("激活Drager类时area对象必须在舞台上")
			return _pool;
		}
	}
}