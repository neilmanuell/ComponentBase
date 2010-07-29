Just think I should declare that this little framework was influenced by the PushButton Engine IEntityComponent.

ToDo:

have the propertyBag object of each component extend the proxy class.
this will mean the unwieldy setProperty/getProperty methods can be accessed:

component.properties.time = new Date();
var  d:Date = component.properties.time;

while still dispatching a PropertyBag event