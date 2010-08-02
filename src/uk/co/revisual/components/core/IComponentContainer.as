
package uk.co.revisual.components.core
{
	import flash.events.IEventDispatcher;
	
	import uk.co.revisual.components.core.IDestructable;
	
  
   public interface IComponentContainer extends IPropertyBag, IEventDispatcher, IDestructable
   {
		function get name():String;
		function get childNum():int;
		function get descNum():int;     
     
	
     
		function addComponent(component:IComponent, name:String=null):Boolean;
		function removeComponent(component:IComponent):void;
		function flush():void;

		function getComponentByName(name:String):IComponent;
		function getComponentAt(index:int):IComponent;
		function getNextComponent(component:IComponent):IComponent;
		function getPreviousComponent(component:IComponent):IComponent;
		function contains(name:String):Boolean;
		function getComponentIndex(component:IComponent):int;
		function getComponentsByType(componentType:Class):Array
   }
}