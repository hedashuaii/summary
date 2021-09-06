function SuperType(name){ 
    this.name = name; 
    this.colors = ["red", "blue", "green"]; 
} 
SuperType.prototype.sayName = function(){ 
    alert(this.name); 
}; 

function SubType(name, age){ 
    SuperType.call(this, name); //第二次调用 SuperType() 
    
    this.age = age; 
} 
SubType.prototype = new SuperType(); //第一次调用 SuperType() 
SubType.prototype.constructor = SubType; 
SubType.prototype.sayAge = function(){ 
    alert(this.age); 
};