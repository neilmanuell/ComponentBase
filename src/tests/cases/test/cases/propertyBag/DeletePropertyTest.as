package tests.cases.test.cases.propertyBag {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;
import uk.co.revisual.components.events.PropertyBagEvent;

public class DeletePropertyTest {

	private var _dispatcher:IEventDispatcher;
	private var _propertyBag:PropertyBag;
	private var _o:Object;
	private var _testEventFired:Boolean;

	[Before]
	public function before():void {
		_o = {test:"Test1"};
		_dispatcher = new EventDispatcher();
		_propertyBag = new PropertyBag( _dispatcher );
		_dispatcher.addEventListener( PropertyBagEvent.DELETE, onDelete );
	}

	[After]
	public function after():void {
		_dispatcher.removeEventListener( PropertyBagEvent.DELETE, onDelete );
		_dispatcher = null;
		_propertyBag = null;
		_o = null;
	}

	[Test]
	// tests deleting a property on the PropertyBag, and that a PropertyBag Event is
	// dispatched with the correct values;
	public function deletePropertyTest():void {

		Assert.assertFalse("Assert 1", _propertyBag.hasOwnProperty("test") );
		_propertyBag.test = _o;
		Assert.assertTrue( "Assert 2", _propertyBag.hasOwnProperty("test") );
		Assert.assertTrue( "Assert 3", delete _propertyBag.test );
		Assert.assertFalse( "Assert 4",_propertyBag.hasOwnProperty("test") );

		Assert.assertTrue( "Assert 5", _testEventFired );
	}

	private function onDelete( event:PropertyBagEvent ):void {
		_testEventFired = true;
		Assert.assertEquals( "Assert 6", "test", event.key );
		Assert.assertStrictlyEquals( "Assert 7", _o, event.oldValue );
	}
}
}