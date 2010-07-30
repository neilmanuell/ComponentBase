package tests.cases.test.cases.propertyBag {
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;

public class CallPropertyTest {

	private var _dispatcher:IEventDispatcher;
	private var _propertyBag:PropertyBag;
	private var _o:Object;

	[Before]
	public function before():void {
		_o = {test:"Test1"};
		_propertyBag = new PropertyBag( _dispatcher );
	}

	[After]
	public function after():void {
		_propertyBag = null;
		_o = null;
	}

	[Test]

	public function callPropertyTest():void {
		Assert.assertFalse( "Assert 1", _propertyBag.hasOwnProperty("test") );
		_propertyBag.test= test;
		Assert.assertTrue( "Assert 2", _propertyBag.hasOwnProperty("test") );
		Assert.assertTrue( "Assert 3", _propertyBag.test( _o ) );
	}

	private function test( o:Object ):Boolean {
		Assert.assertStrictlyEquals( "Assert 4", _o, o );
		return true;
	}
}
}