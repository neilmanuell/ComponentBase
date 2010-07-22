
package uk.co.revisual.components.core
{
	import flash.events.*;
	
	import uk.co.revisual.components.core.IDestructable;
	
   	public interface IComponent
   	{
      
		function get client():IComponentContainer;
      
		function get name():String;
     
		function get isRegistered():Boolean;
      
		function register( parent:IComponentContainer, name:String):void;
      
		function unregister():void;
      
		function reset( component:IComponent, action:String ):void;
		
	}
}