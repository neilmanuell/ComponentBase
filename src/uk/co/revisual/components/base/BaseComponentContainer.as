package uk.co.revisual.components.base
{
	import uk.co.revisual.components.core.IComponent;
	import uk.co.revisual.components.core.IComponentContainer;
	import uk.co.revisual.components.core.IDestructable;
	
	public class BaseComponentContainer extends BaseComponent implements IComponentContainer
	{
		private var _components:Array;
		
		public function get childNum():int{
   			return ( components == null) ? 0 :components.length;
   		}
   	
		public function get descNum():int{
			var desc:int = childNum;
    	 	for each(var c:IComponent in components){
    	 		if(c is IComponentContainer)desc += IComponentContainer(c).descNum;
    	 	}
 			return desc;
		}
   	      
		override public  function destroy():void{
			while (components.length) IDestructable( components.pop() ).destroy();
           _components = null;
           super.destroy();
    	}
     
		public function addComponent(component:IComponent, name:String = null):void{
			if( !doAddComponent( component, name ) ) return;        
			doResetComponents( component, ADDED );
		}
    
		public function removeComponent(component:IComponent):void{
			if( !doRemoveComponent(component) )return;
			doResetComponents( component, REMOVED );
		}
		
		public function flush():void{
			for each(var component:IComponent in components){
				removeComponent( component );
			}
		}
    
		public function contains( name:String ):Boolean{
			return ( getComponentByName( name ) != null );
		}
    
		public function getComponentByName(name:String):IComponent{
			for each(var component:IComponent in components){
				if (component.name == name)return component;
			}
			return null;
		}
  
		public  function getComponentsByType(componentType:Class):Array{
			var a:Array = [];
			for each(var component:IComponent in components) {
				if (component is componentType) a.push(component);
			}
			return a;
		}
    
		public  function getComponentAt( index:int ):IComponent{
			return IComponent( components[ index ] );
		}
		
		public function getNextComponent(component:IComponent):IComponent{
			var i:int = getComponentIndex( component );
			return IComponent( components[i+1] );
		}
		
		public function getPreviousComponent(component:IComponent):IComponent{
			var i:int = getComponentIndex( component );
			return IComponent( components[i-1] );
		}
		
		public function getComponentIndex(component:IComponent):int{
			var n:int = 0;
			var c:IComponent;
			while ( n < components.length ){
				c = IComponent( components[n] );
				if( c === component )return n;
				n++;
			}
			return -1;
		}
		
		private function doAddComponent(component:IComponent, name:String):Boolean{
			if( component.isRegistered )return false;
			if( contains( name ) ) return false;
			components.push( component );
			component.register(this, name);
			return true;
		}
		
		private function doRemoveComponent(component:IComponent):Boolean{
			if( !component.isRegistered )return false;
			if( !contains( component.name ) ) return false;
			component.unregister();
			components.splice( components.indexOf( component ), 1 );
			return true;
		}
  		
		private function doResetComponents( component:IComponent, action:String):void {
			for each(var c:IComponent in components){
				if( c != component )c.reset( component, action );
			}
			
		}
    
		private function get components():Array{
			if( _components == null )return _components = [];
			return _components;
		}
    

	}
}