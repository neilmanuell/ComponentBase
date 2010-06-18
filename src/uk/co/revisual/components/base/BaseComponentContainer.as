package uk.co.revisual.components.base
{
	import uk.co.revisual.components.core.Component;
	import uk.co.revisual.components.core.ComponentContainer;
	import uk.co.revisual.creation.Destructable;
	
	public class BaseComponentContainer extends BaseComponent implements ComponentContainer
	{
		private var _components:Array;
		
		public function get childNum():int{
   			return ( components == null) ? 0 :components.length;
   		}
   	
		public function get descNum():int{
			var desc:int = childNum;
    	 	for each(var c:Component in components){
    	 		if(c is ComponentContainer)desc += ComponentContainer(c).descNum; 
    	 	}
 			return desc;
		}
   	      
		override public  function destroy():void{
			while (components.length) Destructable( components.pop() ).destroy();
           _components = null;
           super.destroy();
    	}
     
		public function addComponent(component:Component, name:String = null):void{
			if( !doAddComponent( component, name ) ) return;        
			doResetComponents( component, ADDED );
		}
    
		public function removeComponent(component:Component):void{
			if( !doRemoveComponent(component) )return;
			doResetComponents( component, REMOVED );
		}
		
		public function flush():void{
			for each(var component:Component in components){
				removeComponent( component );
			}
		}
    
		public function contains( name:String ):Boolean{
			return ( getComponentByName( name ) != null );
		}
    
		public function getComponentByName(name:String):Component{
			for each(var component:Component in components){
				if (component.name == name)return component;
			}
			return null;
		}
  
		public  function getComponentsByType(componentType:Class):Array{
			var a:Array = [];
			for each(var component:Component in components) {
				if (component is componentType) a.push(component);
			}
			return a;
		}
    
		public  function getComponentAt( index:int ):Component{
			return Component( components[ index ] );
		}
		
		public function getNextComponent(component:Component):Component{
			var i:int = getComponentIndex( component );
			return Component( components[i+1] );
		}
		
		public function getPreviousComponent(component:Component):Component{
			var i:int = getComponentIndex( component );
			return Component( components[i-1] );
		}
		
		public function getComponentIndex(component:Component):int{
			var n:int = 0;
			var c:Component;
			while ( n < components.length ){
				c = Component( components[n] );
				if( c === component )return n;
				n++;
			}
			return -1;
		}
		
		private function doAddComponent(component:Component, name:String):Boolean{
			if( component.isRegistered )return false;
			if( contains( name ) ) return false;
			components.push( component );
			component.register(this, name);
			return true;
		}
		
		private function doRemoveComponent(component:Component):Boolean{
			if( !component.isRegistered )return false;
			if( !contains( component.name ) ) return false;
			component.unregister();
			components.splice( components.indexOf( component ), 1 );
			return true;
		}
  		
		private function doResetComponents( component:Component, action:String):void {
			for each(var c:Component in components){
				if( c != component )c.reset( component, action );
			}
			
		}
    
		private function get components():Array{
			if( _components == null )return _components = [];
			return _components;
		}
    

	}
}