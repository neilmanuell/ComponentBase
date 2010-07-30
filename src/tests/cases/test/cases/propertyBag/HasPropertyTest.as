package tests.cases.test.cases.propertyBag {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;
import uk.co.revisual.components.events.PropertyBagEvent;

public class HasPropertyTest {

	private var _dispatcher:IEventDispatcher;
	private var _propertyBag:PropertyBag;
	private var _o:Object = {test:"Test1"};

	[Before]
	public function before():void {
		_propertyBag = new PropertyBag( _dispatcher );
	}

	[After]
	public function after():void {
		_propertyBag = null;
		_o = null;
	}

	[Test]

	public function hasPropertyTest():void {
		Assert.assertFalse( "Assert 1", _propertyBag.hasOwnProperty("test") );
		_propertyBag.test = _o;
		Assert.assertTrue( "Assert 2", _propertyBag.hasOwnProperty("test") );
	}
}
}