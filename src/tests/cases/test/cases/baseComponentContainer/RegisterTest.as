package tests.cases.test.cases.baseComponentContainer {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponent;

public class RegisterTest extends BaseComponentContainer {

	private var _testSubject:IComponent;

	public function RegisterTest() {
		super();
	}

	[Before]
	public function before():void {
		_testSubject = new BaseComponent();
	}

	[After]
	public function after():void {
		removeComponent( _testSubject );
		_testSubject = null;
	}

	[Test]
	public function test():void {
		var name:String = "test";
		Assert.assertFalse("Assert 1", _testSubject.isRegistered );
		Assert.assertTrue( "Assert 2", addComponent( _testSubject, name ) );
		Assert.assertTrue("Assert 3", name, _testSubject.isRegistered );
		Assert.assertStrictlyEquals( "Assert 4", _testSubject, getComponentByName( name ));
		Assert.assertFalse( "Assert 5", addComponent( _testSubject, name ) );
	}
}
}