package tests.cases.test.cases.baseComponent {
import org.flexunit.Assert;

import uk.co.revisual.components.base.BaseComponent;
import uk.co.revisual.components.events.PropertyBagEvent;

public class DestroyTest extends BaseComponent {
	private var _onFlushFired:Boolean;

	public function DestroyTest() {
		super();
	}

	[Before]
	public function before():void {

	}

	[After]
	public function after():void {
		removeEventListener( PropertyBagEvent.FLUSH, onFlush);
		
	}

	[Test]
	public function test():void {
		addEventListener( PropertyBagEvent.FLUSH, onFlush);
		properties.test = "test";
		flushProperties();
		Assert.assertTrue( "Assert 1", _onFlushFired );
		Assert.assertNull( "Assert 2", properties.test );

	}

	private function onFlush(event:PropertyBagEvent):void {
		_onFlushFired  = true;
	}

}
}