var person = { 
    name: "Nicholas", 
    friends: ["Shelby", "Court", "Van"] 
}; 

var anotherPerson = Object.create(person); 
anotherPerson.name = "Greg"; 
anotherPerson.friends.push("Rob"); 
  
var yetAnotherPerson = Object.create(person); 
yetAnotherPerson.name = "Linda"; 
yetAnotherPerson.friends.push("Barbie"); 
alert(person.friends); //"Shelby,Court,Van,Rob,Barbie"