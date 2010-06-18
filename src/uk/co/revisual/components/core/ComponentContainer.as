
package uk.co.revisual.components.core
{
	import flash.events.IEventDispatcher;
	
	import uk.co.revisual.creation.Destructable;
	
  
   public interface ComponentContainer extends PropertyBag, IEventDispatcher, Destructable
   {
		function get name():String;
		function get childNum():int;
		function get descNum():int;     
     
	
     
		function addComponent(component:Component, name:String=null):void;
		function removeComponent(component:Component):void;
		function flush():void;

		function getComponentByName(name:String):Component;
		function getComponentAt(index:int):Component;
		function getNextComponent(component:Component):Component;
		function getPreviousComponent(component:Component):Component;
		function contains(name:String):Boolean;
		function getComponentIndex(component:Component):int;
		function getComponentsByType(componentType:Class):Array
   }
}