package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponent;

public class GetClientTest extends BaseComponentContainer {

	private var _testSubject:IComponent;

	public function GetClientTest() {
		super();
	}

	[Before]
	public function before():void {
		_testSubject = new BaseComponent();
	}

	[After]
	public function after():void {
		_testSubject = null;
	}

	[Test]
	public function test():void {
		Assert.assertNull("Assert 1", _testSubject.client );
		addComponent( _testSubject, "test");
		Assert.assertStrictlyEquals("Assert 2", this, _testSubject.client );
		removeComponent( _testSubject );
		Assert.assertNull("Assert 3", _testSubject.client );
	}
}
}