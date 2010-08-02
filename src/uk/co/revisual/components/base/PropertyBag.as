package uk.co.revisual.components.base {
import flash.events.IEventDispatcher;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

import uk.co.revisual.components.events.PropertyBagEvent;

public dynamic class PropertyBag extends Proxy {

	private var _eventDispatcher:IEventDispatcher;
	private var _items:Object;
	private var _itemNames:Array;

	public function PropertyBag( eventDispatcher:IEventDispatcher = null ) {
		_eventDispatcher = eventDispatcher;
		_items = {};
		_itemNames = [];
	}

	override flash_proxy function deleteProperty( name:* ):Boolean {
		try{
			if( _items.hasOwnProperty( name ) ){
				var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.DELETE, name.toString(), null, _items[name] ) ;
				var result:Boolean = delete _items[name];
				if( result )spliceNameOut( name.toString() );
				dispatch( event );
				return result;
			}
		}catch(error:Error){
			traceError(error)
		}
		return false;
	}

	override flash_proxy function setProperty( name:*, value:* ):void {
		try{
			var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.SET, name.toString(), value, _items[name]) ;
			_items[name] = value;
			_itemNames.push( name.toString() );
			dispatch( event );
		}catch( error:Error ){
			traceError( error );
		}
	}

	override flash_proxy function getProperty(name:*):* {
		return _items[name];
	}

	override flash_proxy function hasProperty(name:*):Boolean {
		return _items.hasOwnProperty(name.toString());
	}

	override flash_proxy function callProperty(methodName:*, ... args):* {
		if( methodName == "flush") return flush();
		else if (methodName == "traceError")trace("Error caught in PropertyBag method:" + args[0].toString());
		else if (_items[methodName] is Function )return ( _items[methodName] as Function ).apply( null, args );
		else return null;
	}

	override flash_proxy function nextNameIndex (index:int):int {
		try{
			if (index < _itemNames.length) return index + 1;
			else return 0;
		}catch(error:Error){
			traceError(error)
		}
		return 0;
	}

	override flash_proxy function nextValue(index:int):*{
		return _items[ _itemNames[index-1] ];
	}

	override flash_proxy function nextName(index:int):String {
		return _itemNames[index - 1];
	}

	private function spliceNameOut( name:String ):void{
		var index:int = _itemNames.indexOf( name );
		_itemNames.splice( index, 1 );
	}


	public function flush():Boolean{
		_items = {};
		_itemNames = [];
		var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.FLUSH ) ;
		dispatch( event );
		return true;
	}

	private function dispatch(event:PropertyBagEvent):void {
		if( _eventDispatcher == null || !_eventDispatcher.hasEventListener( event.type) )return;
		_eventDispatcher.dispatchEvent( event );
	}

	private function traceError(error:Error):void {
		trace("PropertyBag")
	}

}
}