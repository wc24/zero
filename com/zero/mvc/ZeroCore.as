package com.zero.mvc {
	
	public class ZeroCore {
		public var zero:Zero = Zero.self;
		public function ZeroCore() {
		}
		/**
		 * 使用类名,找出该类名下以Name为识标的该类的单例
		 * @param	proxyClass 要查找的类名
		 * @return	该类的单例
		 */
		public function foundProxy(proxyClass:Class):Proxy {
			return zero.foundProxy(proxyClass)
		}
	}
}