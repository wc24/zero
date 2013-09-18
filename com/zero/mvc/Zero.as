package com.zero.mvc {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public class Zero implements IEventDispatcher {
		static private var _commandList:Object = {};
		static private var _commandClassList:Object = {};
		static private var _proxyList:Object = {};
		static private var _mediatorList:Object = {};
		static private var _mediatorId:int;
		/**
		 * 公开自身
		 */
		static public var self:Zero = new Zero();
		/**
		 * 公开事件派发自身
		 */
		static public var eventDispatcher:ZeroEventDispatcher = new ZeroEventDispatcher(self);
		/**
		 * 无指令，Command 必须继承 com.zero.mvc.Command
		 */
		static public var NO_COMMAND:String = "Command 必须继承 com.zero.mvc.Command";
		/**
		 * Command 类 的静态属NAME必须设定，并且要设定为唯一字符串
		 */
		static public const NO_NAME:String = "Command 类 的静态属NAME必须设定，并且要设定为唯一字符串";
		/**
		 * Proxy不存在
		 */
		static public const NO_PROXY:String = "Proxy不存在:";
		static public const UNNECESSARY_COMMAND:String = "Command 类不可对应的同一指今";
		
		public function Zero() {
		}
		
		/**
		 * 触发新指令
		 * @param	event 触发指令用到 Event 载体。
		 * @return 如果成功触发指令，则值为 true。值 false 表示失败或对事件调用了 preventDefault()。
		 */
		public function command(event:ZeroEvent):Boolean {
			return eventDispatcher.dispatchEvent(event);
		}
		
		/**
		 * 注册新Command类,每条指令只能对应一个Command类
		 * 如每一条指令有多个不同的处理逻辑,请使用 addEventListener;
		 * @param	commandClass 添加的指令
		 */
		public function addCommand(commandClass:Class):void {
			if (commandClass as Command) {
				throw NO_COMMAND;
			}
			if (commandClass["NAME"] == null) {
				throw NO_NAME;
			} else if (commandClassList[commandClass["NAME"]] != null) {
				throw UNNECESSARY_COMMAND + " :" + commandClass;
			} else {
				commandClassList[commandClass["NAME"]] = commandClass;
				eventDispatcher.addEventListener(commandClass["NAME"], commandCentre);
			}
		}
		
		/**
		 *
		 * @param	event 添加事件
		 */
		public function commandCentre(event:ZeroEvent):void {
			var commandClass:Class = commandClassList[event.type];
			if (commandList[event.type] == null) {
				commandList[event.type] = new commandClass();
				(commandList[event.type] as Command).name = event.type;
			}
			var command:Command = commandList[event.type] as Command;
			command.event = event;
			command.execute();
		}
		
		/**
		 *
		 * @param	command 要释放不需要的指令
		 */
		public function disposeCommand(command:Command):void {
			delete commandList[command.name];
		}
		
		/**
		 *
		 * @param	proxy	添加代理
		 * @return
		 */
		public function addProxy(proxy:Proxy):Proxy {
			if (proxyList[proxy.proxyName] == null) {
				proxyList[proxy.proxyName] = proxy;
				proxy.dispatchEvent(new ProxyEvent(ProxyEvent.ADD));
			}
			return proxy
		}
		
		/**
		 *
		 * @param	proxyName 移除代理名称，输入字符，直接移除代理
		 */
		public function removeProxy(proxyName:String):void {
			var proxy:Proxy = proxyList[proxy.proxyName] as Proxy
			proxy.dispatchEvent(new ProxyEvent(ProxyEvent.REMOVE));
			delete proxyList[proxy.proxyName]
		}
		
		/**
		 *
		 * @param	mediator 添加视图管理器
		 */
		public function addMediator(mediator:Mediator):void {
			mediator.mediatorId = mediatorId
			mediatorList[mediator.mediatorId] = mediator;
			mediator.dispatchEvent(new MediatorEvent(MediatorEvent.ADD));
		}
		
		/**
		 *
		 * @param	mediator	移除视图管理器
		 */
		public function removeMediator(mediator:Mediator):void {
			mediator.dispatchEvent(new MediatorEvent(MediatorEvent.REMOVE));
			delete mediatorList[mediator.mediatorId]
		}
		
		/**
		 *
		 * @param	proxyName	代理的名称，直接指向代理
		 * @return
		 */
		public function getProxy(proxyName:String):Proxy {
			var proxy:Proxy = proxyList[proxyName] as Proxy;
			if (proxy == null) {
				throw(NO_PROXY + proxyName)
			}
			return proxy
		}
		
		/**
		 *
		 * @param	proxyClass 搜索代理
		 * @return	返回新代理
		 */
		public function foundProxy(proxyClass:Class):Proxy {
			var proxy:Proxy = proxyList[proxyClass.NAME] as Proxy;
			if (proxy == null) {
				proxy = addProxy(new proxyClass());
			}
			return proxy
		}
		
		/* INTERFACE flash.events.IEventDispatcher */ /**
		 * 添加事件
		 * @param	type 事件监听类型
		 * @param	listener 事件执行函数
		 * @param	useCapture	是否捕获
		 * @param	priority	优先次序
		 * @param	useWeakReference	是否设置为弱引用。如果被设置为true，则表示告诉Flash Player，当直接引用这个监听器的对象数量为0时，就可以马上回收它。默认是false的话，还需要遍历这个引用可以到达的其它引用，确保不会发生循环引用时才回收资源。
		 */
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		/**
		 *
		 * @param	type	移除事件监听类型
		 * @param	listener	移除事件执行函数
		 * @param	useCapture	是否捕获
		 */
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		/**
		 *
		 * @param	event	事件分发类型。
		 * @return	如果成功分发时间，则值为 true。值 false 表示失败或对事件调用了 preventDefault()。
		 */
		public function dispatchEvent(event:Event):Boolean {
			return eventDispatcher.dispatchEvent(event)
		}
		
		/**
		 *
		 * @param	type  检测是否监听某个特别事件
		 * @return	值为 true表示当前事件是所检测类型，则值为false表示当前事件非所检测类型；
		 */
		public function hasEventListener(type:String):Boolean {
			return eventDispatcher.hasEventListener(type);
		}
		
		/**
		 *
		 * @param	type 检测是否监听某个特别事件
		 * @return	值为 true表示当前事件是所检测类型，则值为false表示当前事件非所检测类型；
		 */
		public function willTrigger(type:String):Boolean {
			return eventDispatcher.willTrigger(type);
		}
		
		/**
		 * 视图管理器的ID，返回INT值
		 */
		public function get mediatorId():int {
			return _mediatorId++;
		}
		
		/**
		 * 视图管理器列表，返回obj值
		 */
		public function get mediatorList():Object {
			return _mediatorList;
		}
		
		/**
		 * 视图代理列表，返回obj值
		 */
		public function get proxyList():Object {
			return _proxyList;
		}
		
		/**
		 * 指令列表，返回obj值
		 */
		public function get commandList():Object {
			return _commandList;
		}
		
		/**
		 * 指令类列表，返回obj值
		 */
		public function get commandClassList():Object {
			return _commandClassList;
		}
	}
}