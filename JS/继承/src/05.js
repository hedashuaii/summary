function createAnother(original){ 
    var clone = object(original); //通过调用函数创建一个新对象

    clone.sayHi = function(){ //以某种方式来增强这个对象
        alert("hi"); 
    }; 

    return clone; //返回这个对象
}

var person = { 
    name: "Nicholas", 
    friends: ["Shelby", "Court", "Van"] 
}; 

var anotherPerson = createAnother(person); 
anotherPerson.sayHi(); //"hi"