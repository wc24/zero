package com.xmas.utils {
	
	public class Wildcard {
		public var rearSymbol:String;
		public var preSymbol:String;
		/**
		 * 
		 */
		public function Wildcard(preSymbol:String = "\\{", rearSymbol:String = "\\}") {
			this.rearSymbol = rearSymbol;
			this.preSymbol = preSymbol;
		}
		
		public function replace(prototype:String, permute:Object):String {
			for (var name:String in permute) {
				var myPattern:RegExp = new RegExp(preSymbol + name + rearSymbol, "g");
				if (prototype.search(myPattern) == -1) {
					prototype = prototype + permute[name] + " "
				} else {
					prototype = prototype.replace(myPattern, permute[name]);
				}
			}
			return prototype
		}
	}
}