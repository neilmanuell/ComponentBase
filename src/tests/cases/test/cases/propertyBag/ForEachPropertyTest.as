package tests.cases.test.cases.propertyBag {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import org.flexunit.Assert;

import uk.co.revisual.components.base.PropertyBag;
import uk.co.revisual.components.events.PropertyBagEvent;

public class ForEachPropertyTest {

	private var _propertyBag:PropertyBag;
	private var _o1:Object;
	private var _o2:Object;
	private var _o3:Object;
	private var _o4:Object;
	private var _o5:Object;
	private var _testItems:Array;

	[Before]
	public function before():void {
		_propertyBag = new PropertyBag(  );
		_o1 = {test:"Test1"};
		_o2 = {test:"Test2"};
		_o3 = {test:"Test3"};
		_o4 = {test:"Test4"};
		_o5 = {test:"Test5"};
		_testItems = [ _o1, _o2, _o3, _o4, _o5 ];
	}

	[After]
	public function after():void {
		_propertyBag = null;
		_o1 = null;
		_o2 = null;
		_o3 = null;
		_o4 = null;
		_o5 = null;
		_testItems = null;
	}

	[Test]
	public function forEachInPropertyBagTest():void {
		var count:int;
		_propertyBag.test1 = _o1;
		_propertyBag.test2 = _o2;
		_propertyBag.test3 = _o3;
		_propertyBag.test4 = _o4;
		_propertyBag.test5 = _o5;

		for each ( var o:Object in _propertyBag ){
			Assert.assertStrictlyEquals("Assert " + count, _testItems[ count ], o  );
			count++;
		}
	}
}
}