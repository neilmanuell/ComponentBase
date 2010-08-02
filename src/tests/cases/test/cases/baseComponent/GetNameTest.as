package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponent;

public class GetNameTest extends BaseComponentContainer {

	private var _testSubject:IComponent;

	public function GetNameTest() {
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
		Assert.assertNull("Assert 1", _testSubject.name );
		addComponent( _testSubject, name );
		Assert.assertEquals("Assert 2", name, _testSubject.name );
		removeComponent( _testSubject );
		Assert.assertNull("Assert 3", _testSubject.name );
	}
}
}