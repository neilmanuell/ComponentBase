package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponentContainer;

public class FlushPropertiesTest extends BaseComponent {

	private var _o1:Object;
	private var _o2:Object;

	public function FlushPropertiesTest() {
		super();
	}

	[Before]
	public function before():void {
		_o1 = {test:"test1"};
		_o2 = {test:"test2"};
	}

	[After]
	public function after():void {
		_o1 = null;
		_o2 = null;
	}

	[Test]
	public function test():void {
		Assert.assertFalse("Assert 1", flushProperties() );
		properties.test1 = _o1;
		properties.test2 = _o2;
		Assert.assertStrictlyEquals("Assert 2", _o1, properties.test1 );
		Assert.assertStrictlyEquals("Assert 3", _o2, properties.test2 );
		Assert.assertTrue( "Assert 4", flushProperties() );
		Assert.assertNull("Assert 5", properties.test1 );
		Assert.assertNull("Assert 6", properties.test2 );

	}

}
}