package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponent;

public class GetIsRegisteredTest extends BaseComponentContainer {

	private var _testSubject:IComponent;

	public function GetIsRegisteredTest() {
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
		var name:String = "test";
		Assert.assertFalse("Assert 1", _testSubject.isRegistered );
		addComponent( _testSubject, name );
		Assert.assertTrue("Assert 2", name, _testSubject.isRegistered );
		removeComponent( _testSubject );
		Assert.assertFalse("Assert 3", _testSubject.isRegistered );
	}
}
}