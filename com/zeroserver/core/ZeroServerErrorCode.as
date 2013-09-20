package com.zeroserver.core {
	
	public class ZeroServerErrorCode {
		static public const REMOTE_FAULT:String = "remoteFault"; //方法调用失败(内容);
		static public const CALL_FAILED:String = "callFailed" //方法调用失败(方法不存在,或参数有误);
		static public const SECURITY_ERROR:String = "securityError";
		static public const IO_ERROR:String = "ioError";
		static public const ASYNC_ERROR:String = "asyncError";
		static public const OVERTIME:String = "overtime";
		static public const OVERLAP_Router_KEY:String = "overlapRouterKey";
		static public const NO_COMMAND:String = "noCommand"; //
		//---------------------------------------
		static public const NO_PACK_PARSE:String = "noPackParse";
		static public const NO_PACK:String = "noPack";
		static public const NO_PACK_DATA:String = "noPackData";
		static public const NO_BYTE_ARRAY_PARSE:String = "noByteArrayParse";
		static public const NO_REPORT:String = "noReport";
	}
}