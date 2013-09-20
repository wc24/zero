package com.xmas.utils {
	/**
	 * 对数字进行限制取值范围.当最小值大于最大值时:最大值当最小值用,最小值当最大值用.
	 * @example
	 * 此示例将不同的数值限制在2到5取值范围
	 * <listing version="3.0">
	   package
	   {
	   import com.xmas.utils;
	   import flash.display.Sprite;
	
	   public class Main extends Sprite
	   {
	   public function Main():void
	   {
	   trace(bound(-1, 2, 5)); //2
	   trace(bound(1, 2, 5)); //2
	   trace(bound(2, 2, 5)); //2
	   trace(bound(3, 2, 5)); //3
	   trace(bound(6, 2, 5)); //5
	   trace(bound(6, 5, 2)); //5
	   }
	   }
	   }</listing>
	 * @param   value       要处理的数字
	 * @param	min			最小值
	 * @param	max			最大值
	 * @return	Number		在取值范围内的数字
	 */
	public function bound(value:Number, min:Number, max:Number):Number {
		if (min > max) {
			return value < max ? max : (value > min ? min : value)
		} else {
			return value < min ? min : (value > max ? max : value)
		}
	}
}