//: [Previous](@previous)

import Foundation

/*: if 语句*/
// 简单的if语句
let score = 99.0
if score > 80 {
    print("优秀")
} else {
    print("非优秀")
}

// 可以将if语句和 let 一起来处理值缺失的情况
//var optionalName: String? = nil // 此时，不会执行if判断中大括号中的逻辑
var optionalName: String? = "John Appleseed" // 会执行大括号中的内容
var greeting = "Hello!"
if let name = optionalName { // 将值解包并赋给 let 后面的常量 'name'，这样代码块中就可以使用这个值了
    print("Hello, \(name)")
}


/*: switch...case... */
// 有点类似kotlin中的特性，至少比java好用多了，另外不需要写break
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


/*: for-in*/
// 使用 for-in 来遍历字典
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (key, arrValue) in interestingNumbers { // 可以同时获取字典中的key和value
    for number in arrValue { // 继续遍历数组形式的value
        if number > largest {
            largest = number
        }
    } }
print(largest)


/*: while*/
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

/*: do...while*/
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


/*: ..< */
// 在循环中使用 ..< 来表示范围。
var total = 0
for i in 0..<4 {
    total += i }
print(total)

/*:  */

//: [Next](@next)
