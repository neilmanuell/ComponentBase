package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.base.BaseComponentContainer;
import uk.co.revisual.components.core.IComponentContainer;

public class UnregisterTest extends BaseComponent {

	private var _onUnregisterCalled:Boolean;
	private var _client:IComponentContainer;
	private var _name:String;

	public function UnregisterTest() {
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

		Assert.assertTrue("Assert 1", register( _client, _name ) );
		Assert.assertStrictlyEquals("Assert 2", _client, client );
		Assert.assertStrictlyEquals("Assert 3", _name, name );

		Assert.assertTrue("Assert 4", unregister() );
		Assert.assertNull( "Assert 5", client );
		Assert.assertNull( "Assert 6", name );
		Assert.assertTrue("Assert 7", _onUnregisterCalled );

		_onUnregisterCalled = false;
		Assert.assertFalse("Assert 8", unregister() );
		Assert.assertFalse("Assert 9", _onUnregisterCalled );

	}

	override protected function onUnregister():void {
		_onUnregisterCalled = true;
	}
}
}