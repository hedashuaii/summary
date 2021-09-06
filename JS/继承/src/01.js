// 父类
function SuperType(name, age) {
    this.name = name;
    this.age = age;
}
SuperType.prototype = {
    constructor: SuperType,
    sayName: function() {
        console.log(this.name);
    }
}

// 子类
function SubType(name, age, sex) {
    // 继承父类的属性
    SuperType.call(this, name, age);

    // 自有属性
    this.sex = sex;
}
// 继承父类的方法
SubType.prototype = new SuperType();
SubType.prototype.constructor = SubType;

// 自有方法
SubType.prototype.sayAge = function() {
    console.log(this.age);
}