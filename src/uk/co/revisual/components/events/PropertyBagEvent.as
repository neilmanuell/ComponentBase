package uk.co.revisual.components.events
{
	import flash.events.Event;

	public class PropertyBagEvent extends Event
	{
		public static const FLUSH:String = "propertyFlush";
		public static const SET:String = "propertySet";
		
		private var _key:String;
		private var _oldValue:Object;
		private var _newValue:Object;
		
		public function PropertyBagEvent(type:String, key:String = null, newValue:Object = null, oldValue:Object = null ):void{
			_key = key;
			_oldValue = oldValue;
			_newValue = newValue;
			super(type, bubbles, cancelable);
		}
		
		public function get key():String{
			return _key;
		}
		
		public function get oldValue():Object{
			return _oldValue;
		}
		
		public function get newValue():Object{
			return _newValue;
		}
		
		override public function clone():Event{
			return new PropertyBagEvent( type, _key, _oldValue, _newValue)
		}
		
	}
}