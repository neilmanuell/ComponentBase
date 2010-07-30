package uk.co.revisual.components.base {
import flash.events.IEventDispatcher;
import flash.utils.Proxy;
import flash.utils.flash_proxy;

import uk.co.revisual.components.events.PropertyBagEvent;

public dynamic class PropertyBag extends Proxy {

	private var _eventDispatcher:IEventDispatcher;
	private var _items:Object;

	public function PropertyBag( eventDispatcher:IEventDispatcher = null ) {
		_eventDispatcher = eventDispatcher;
		_items = {};
	}

	override flash_proxy function deleteProperty( name:* ):Boolean {
		if( _items.hasOwnProperty( name.toString() ) ){
			var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.DELETE, name.toString(), null, _items[name] ) ;
			var result:Boolean = delete _items[name];
			dispatch( event );
			return result;
		}
		return false;
	}

	override flash_proxy function setProperty( name:*, value:* ):void {
		var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.SET, name.toString(), value, _items[name]) ;
		_items[name] = value;
		dispatch( event );
	}

	override flash_proxy function getProperty(name:*):* {
		return _items[name];
	}

	override flash_proxy function hasProperty(name:*):Boolean {
		return _items.hasOwnProperty(name.toString());
	}

	override flash_proxy function callProperty(methodName:*, ... args):* {
		if( methodName == "flush") return flush();
		else if (_items[methodName] is Function )return ( _items[methodName] as Function ).apply( null, args );
		else return null;
	}

	private function flush():void{
		_items = {};
		var event:PropertyBagEvent = new PropertyBagEvent(  PropertyBagEvent.FLUSH ) ;
		dispatch( event );
	}

	private function dispatch(event:PropertyBagEvent):void {
		if( _eventDispatcher == null || !_eventDispatcher.hasEventListener( event.type) )return;
		_eventDispatcher.dispatchEvent( event );
	}

}
}