package com.xmas.utils {
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class XmasError extends Error {
		private static var pool:Vector.<String> = initPool
		public static const length:int = pool.length;
		public static const wildcard:Wildcard = new Wildcard();
		
		public function XmasError(errorID:uint, ... arg) {
			if (errorID < length) {
				super(wildcard.replace(pool[errorID], arg), errorID);
			} else {
				throw(new XmasError(0))
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