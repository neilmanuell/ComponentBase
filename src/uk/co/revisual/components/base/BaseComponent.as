
package uk.co.revisual.components.base
{
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import uk.co.revisual.components.core.IComponent;
import uk.co.revisual.components.core.IComponentContainer;
import uk.co.revisual.components.core.IDestructable;
import uk.co.revisual.components.core.IPropertyBag;

public class BaseComponent extends EventDispatcher implements IComponent, IPropertyBag, IEventDispatcher, IDestructable{

    protected static const ADDED:String = "added";
    protected static const REMOVED:String = "removed";

    private static const REGISTER_ERROR:String = "This component has already been registered";
    private static const UNREGISTER_ERROR:String = "This component is not registered in this Container";

    private var _propertyBag:PropertyBag;
    private var _client:IComponentContainer;
    private var _name:String;

    public function get client():IComponentContainer{ return _client; }

    public function get name():String{ return _name; }

    public function get isRegistered():Boolean{ return ( _client != null ); }

    public function destroy():void{
        flushProperties();
        if(isRegistered)unregister();
    }

    public function register( client:IComponentContainer, name:String):void{
        if(isRegistered) throw new Error(REGISTER_ERROR);
        _name = name;
        _client = client;
        onRegister();
    }

    public function unregister():void{
        if(!isRegistered) throw new Error(UNREGISTER_ERROR);
        onUnregister();
        _name = null;
        _client = null;
    }

    public function get properties():Object {
        if( _propertyBag == null ) _propertyBag = new PropertyBag( this );
        return _propertyBag;
    }

    public function reset( component:IComponent, action:String ):void{
        if(action == BaseComponent.ADDED)onResetAdded( component );
        else  if(action == BaseComponent.REMOVED)onResetRemoved( component );
    }

    public function flushProperties():void{
        _propertyBag.flush();
    }

    protected function onRegister():void{ }

    protected function onUnregister():void{ }

    protected function onResetAdded( component:IComponent ):void{ }

    protected function onResetRemoved( component:IComponent ):void{ }

    private function get propertyBag():Object{
        if(!_propertyBag)flushProperties();
        return _propertyBag
    }


}
}