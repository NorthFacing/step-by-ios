//: [Previous](@previous)

import Foundation

/*: 1.变量和常量 */

// 变量赋值之后不能更改数值
let name = "bob"
print(name)

// 常量复制之后可以进行更改
var age = 18
print(age)
age = 19
print(age)



/*: 基本数据类型*/
// 基本类型 TODO 待补充……
var string:String = "string type"
var int:Int = 1
var double:Double = 88.8
var float:Float = 88.8
var boolean:Bool = true

/*: 基本数据结构 */
// 空的数组和字典
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 数组 Array，使用下标来访问元素
var shoppingList:Array = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
// 字典 Dictionary，使用键(key)来访问元素，需要注意的是，字典是一个无序的集合，所以遍历的时候可能是任何顺序结束
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"



/*: 类型推断 */
// 自动推导出时double类型
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
// 如果初始值没有提供足够的信息(或者没有初始值)，那你需要在变量后面声明类型，用冒号分割。
var salary:Double
salary = 5000
print(salary)

/*: 类型转换*/
// 值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。
let label = "The width is"
let width = 94
let widthLabel = label + String(width)
// 一种更方便的转换成String类型的方法
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


/*: 空值安全 */
// ？ 表示可以为空
// ! 表示不能为空
var double01:Double?
print(double01 ?? 0.0) // 如果为空，那么设置一个默认值
salary = 5000
print(double01 ?? 0.0)


//: [Next](@next)
