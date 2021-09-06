function SuperType(){ 
    this.property = true; 
} 

SuperType.prototype.getSuperValue = function(){ 
    return this.property; 
}; 

function SubType(){ 
    this.subproperty = false; 
} 

//继承了 SuperType 
SubType.prototype = new SuperType(); 

SubType.prototype.getSubValue = function (){ 
    return this.subproperty; 
}; 

var instance = new SubType(); 
alert(instance.getSuperValue()); //true