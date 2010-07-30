package tests.cases.test.cases.propertyBag {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;
import uk.co.revisual.components.events.PropertyBagEvent;

public class GetSetPropertyTest {

	private var _dispatcher:IEventDispatcher;
	private var _propertyBag:PropertyBag;
	private var _o1:Object = {test:"Test1"};
	private var _o2:Object = {test:"Test2"};
	private var _test1EventFiredCount:int;
	private var _test2EventFiredCount:int;

	[Before]
	public function before():void {
		_dispatcher = new EventDispatcher();
		_propertyBag = new PropertyBag( _dispatcher );
		_dispatcher.addEventListener( PropertyBagEvent.SET, onSet );
	}

	[After]
	public function after():void {
		_dispatcher.removeEventListener( PropertyBagEvent.SET, onSet );
		_dispatcher = null;
		_propertyBag = null;
		_o1 = null;
		_o2 = null;
	}

	[Test]
	// tests get and setting properties on the PropertyBag, and that a PropertyBag Event is
	// dispatched with the correct values;
	public function getSetPropertyTest():void {

		// test both accessor types
		_propertyBag["test1"] = _o1;
		_propertyBag.test2 = _o2;

		// get the values and test
		Assert.assertStrictlyEquals( "Assert 1", _o1, _propertyBag["test1"]);
		Assert.assertStrictlyEquals( "Assert 2", _o2, _propertyBag.test2);

		// test that the changed event fired
		Assert.assertEquals( "Assert 3", 1, _test1EventFiredCount );
		Assert.assertEquals( "Assert 4", 1, _test2EventFiredCount );


		// change their values again to test old/new values in event
		_propertyBag["test1"] = _o2;
		_propertyBag.test2 = _o1;

		// get values and test
		Assert.assertStrictlyEquals( "Assert 5", _o2, _propertyBag["test1"]);
		Assert.assertStrictlyEquals( "Assert 6", _o1, _propertyBag.test2);

		// test that the changed event fired
		Assert.assertEquals( "Assert 7", 2, _test1EventFiredCount );
		Assert.assertEquals( "Assert 8", 2, _test2EventFiredCount );

	}

	private function onSet( event:PropertyBagEvent ):void {
		var key:String = event.key;
		switch( true ){
			case ( key == "test1" && _test1EventFiredCount == 0 ):
				_test1EventFiredCount++;
				// first test, first time
				Assert.assertStrictlyEquals( "Assert 9", _o1, event.newValue );
				Assert.assertNull( "Assert 10", event.oldValue );
				break;

			case ( key == "test1" && _test1EventFiredCount == 1 ):
				_test1EventFiredCount++;
				// first test second time
				Assert.assertStrictlyEquals( "Assert 11", _o2, event.newValue );
				Assert.assertStrictlyEquals( "Assert 12", _o1, event.oldValue );
				break;

			case ( key == "test2" && _test2EventFiredCount == 0 ):
				_test2EventFiredCount++;
				// second test first time
				Assert.assertStrictlyEquals( "Assert 13", _o2, event.newValue );
				Assert.assertNull( "Assert 14", event.oldValue );
				break;

			case ( key == "test2" && _test2EventFiredCount == 1 ):
				_test2EventFiredCount++;
				// second test  second time
				Assert.assertStrictlyEquals( "Assert 15", _o1, event.newValue );
				Assert.assertStrictlyEquals( "Assert 16", _o2, event.oldValue );
				break;

			default:
				Assert.fail("an unaccounted property has been added: " + key);

		}
	}
}
}