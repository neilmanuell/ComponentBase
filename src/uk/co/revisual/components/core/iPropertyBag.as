package uk.co.revisual.components.core
{
import uk.co.revisual.components.base.PropertyBag;

public interface IPropertyBag
	{
		function get properties():PropertyBag;
		function flushProperties(  ):Boolean;
        
	}
}