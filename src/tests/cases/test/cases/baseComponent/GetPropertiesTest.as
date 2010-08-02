package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponent;
import uk.co.revisual.components.core.IPropertyBag;

public class GetPropertiesTest {

	private var _testSubject:IPropertyBag;

	public function GetPropertiesTest() {
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
		Assert.assertTrue( "Assert 1", ( _testSubject.properties) )
	}
}
}