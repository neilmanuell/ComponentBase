package tests.cases.test.cases.propertyBag {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;
import uk.co.revisual.components.events.PropertyBagEvent;

public class NullEventDispatcherTest {

	private var _propertyBag:PropertyBag;
	private var _o:Object;
	private var _testEventFired:Boolean;

	[Before]
	public function before():void {
		_o = {test:"Test1"};
		_propertyBag = new PropertyBag( );
	}

	[After]
	public function after():void {
		_propertyBag = null;
		_o = null;
	}

	[Test]
	public function deletePropertyTestWithoutEventDispatching():void {
		Assert.assertFalse("Assert 1", _propertyBag.hasOwnProperty("test") );
		_propertyBag.test = _o;
		Assert.assertTrue( "Assert 2", _propertyBag.hasOwnProperty("test") );
		Assert.assertTrue( "Assert 3", delete _propertyBag.test );
		Assert.assertFalse( "Assert 4",_propertyBag.hasOwnProperty("test") );
	}

}
}