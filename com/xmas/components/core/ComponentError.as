package com.xmas.components.core {
	import com.zero.utils.ZeroError;
	
	/**
	 * ...
	 * @author 蓝面包
	 */
	public class ComponentError extends ZeroError {
		
		public function ComponentError(errorID:uint, ... arg) {
			super(errorID);
		
		}
	
	}

}