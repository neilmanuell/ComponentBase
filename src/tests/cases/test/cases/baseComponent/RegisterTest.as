package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponentContainer;

public class RegisterTest extends BaseComponent {

	private var _onRegisterCalled:Boolean;
	private var _client:IComponentContainer;
	private var _name:String;

	public function RegisterTest() {
		super();
	}

	[Before]
	public function before():void {
		_client = new BaseComponentContainer();
		_name = "test";
	}

	[After]
	public function after():void {
	   _client = null;
		destroy();
	}

	[Test]
	public function test():void {
		Assert.assertNull( "Assert 1", client );
		Assert.assertNull( "Assert 2", name );
		Assert.assertTrue("Assert 3", register( _client, _name ) );
		Assert.assertStrictlyEquals("Assert 4", _client, client );
		Assert.assertStrictlyEquals("Assert 5", _name, name );
		Assert.assertTrue("Assert 6", _onRegisterCalled );

		_onRegisterCalled = false;
		Assert.assertFalse("Assert 7", register( _client, _name ) );
		Assert.assertFalse("Assert 8", _onRegisterCalled );

	}

	override protected function onRegister():void {
		_onRegisterCalled = true;
	}
}
}