
package uk.co.revisual.components.core
{
	import flash.events.*;
	
	import uk.co.revisual.creation.Destructable;
	
   	public interface Component
   	{
      
		function get client():ComponentContainer;
      
		function get name():String;
     
		function get isRegistered():Boolean;
      
		function register( parent:ComponentContainer, name:String):void;
      
		function unregister():void;
      
		function reset( component:Component, action:String ):void;
		
	}
}