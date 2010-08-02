package tests.cases.test.cases.propertyBagEvent {
import org.flexunit.Assert;

import uk.co.revisual.components.events.PropertyBagEvent;

public class PropertyBagEventTest extends PropertyBagEvent {

	private var _key:String = "test";
	private var _newValue:Object = {test:"test1"};
	private var _oldValue:Object = {test:"test2"};

	public function PropertyBagEventTest() {
		super( SET, _key, _newValue, _oldValue );
	}

	[Test]
	public function propertyTest():void {
		Assert.assertStrictlyEquals("Assert 1", _key, key);
		Assert.assertStrictlyEquals("Assert 2", _newValue, newValue);
		Assert.assertStrictlyEquals("Assert 3", _oldValue, oldValue);
	}

}
}