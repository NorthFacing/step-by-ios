//: [Previous](@previous)

import Foundation

/*: 函数定义 */

// 使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值的类型。
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
let result1 = greet(person:"Bob", day: "Tuesday") // person 和 day 为默认参数标签
print(result1)

/*: 函数参数标签 */
// 默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func greet(_ person: String, on day: String) -> String { // TODO function name could be the same one, sa long as they have different params
    return "Hello \(person), today is \(day)."
}
let result2 = greet("John", on: "Wednesday") // on 为自定义参数标签
print(result2)

/*: 函数多个返回值 */
// 使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)


/*: 函数可变参数 */
// 可变个数的参数
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers { // 参数 numbers 在函数内表现为数组的形式
        sum += number
    }
    return sum
}
let sum1 = sumOf()
print(sum1)
let sum2 = sumOf(numbers: 42, 597, 12)
print(sum2)

/*: 函数嵌套 */
// 函数可以嵌套
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
let add = returnFifteen()
print(add)

/*: 函数及可以作为参数也可以作为返回值 */
// 函数是第一等类型
// -- 这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
let increm = increment(7)
print(increm)
// -- 也可以当做参数传入另一个函数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
let match = hasAnyMatches(list: numbers, condition: lessThanTen)
print(match)

/*: 闭包： */
// 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。
// 闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。
// 你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// 有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// 你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。当一个闭包是传给函数的唯一参数，你可以完全忽略括号。
let sortedNumbers1 = numbers.sorted(){ $0 > $1 }
print(sortedNumbers1)
let sortedNumbers2 = numbers.sorted{ $0 > $1 }
print(sortedNumbers2)





















//: [Next](@next)
