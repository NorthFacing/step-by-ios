//: [Previous](@previous)

import Foundation

/*: 定义class类 */
// 使用class和类名来创建一个类。

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*: 创建一个类的实例 */
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

/*: 构造器 */
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) { // 构造器
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*: 定义子类 */
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) { // 构造器
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String { // override 标志方法覆写
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/*:  getter 和 setter */
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0 // 在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

/*: 枚举和结构体*/
// 使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue) // TODO rawValue 是什么东西
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue


















//: [Next](@next)
