package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.core.IComponent;

public class ResetTest extends BaseComponent {
    private var _testComponent:IComponent;
	private var _onResetAddedCalled:Boolean;
	private var _onResetRemovedCalled:Boolean;

	public function ResetTest() {
		super();
	}

	[Before]
	public function before():void {
		_testComponent = new BaseComponent();

	}

	[After]
	public function after():void {
	   _testComponent = null;
		destroy();
	}

	[Test]
	public function test():void {

		reset( _testComponent, ADDED );
		Assert.assertTrue(_onResetAddedCalled);

		reset( _testComponent, REMOVED );
		Assert.assertTrue(_onResetRemovedCalled);

	}

	override protected function onResetAdded(component:IComponent):void {
		Assert.assertStrictlyEquals("Assert B1", _testComponent, component);
		_onResetAddedCalled = true;
	}

	override protected function onResetRemoved(component:IComponent):void {
		Assert.assertStrictlyEquals("Assert C1", _testComponent, component);
		_onResetRemovedCalled = true;
	}
}
}