package uk.co.revisual.components.core
{
	public interface PropertyBag
	{
		function hasProperty( key:String ):Boolean;
		function setProperty( key:String, value:Object ):Object;
		function getProperty( key:String, defaultValue:Object=null ):Object;
		function flushProperties(  ):void;
	}
}