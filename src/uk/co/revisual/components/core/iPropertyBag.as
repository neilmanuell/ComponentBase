package uk.co.revisual.components.core
{
	public interface IPropertyBag
	{
		function hasProperty( key:String ):Boolean;
		function setProperty( key:String, value:Object ):Object;
		function getProperty( key:String, defaultValue:Object=null ):Object;
		function flushProperties(  ):void;
	}
}