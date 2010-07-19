package uk.co.revisual.creation {
public interface IPlugin extends ICreatable {

    function get id ():String;
    function get description():String;
    function get type():String;
    
}
}