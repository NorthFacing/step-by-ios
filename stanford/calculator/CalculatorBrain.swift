//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Bob on 2017/1/7.
//  Copyright © 2017年 Bob. All rights reserved.
//

import Foundation

// 如果不用lambda表达式，可以使用函数进行加减乘除的处理
private func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

class CalculatorBrain {

    private var accumulator = 0.0

    func setOperand(operand: Double) {
        accumulator = operand
    }

    private var operations: Dictionary<String, Operation> = [
            "π": Operation.Constant(M_PI),
            "ℯ": Operation.Constant(M_E),
            "√": Operation.UnaryOperation(sqrt),
            "cos": Operation.UnaryOperation(cos),
            "+": Operation.BinaryOperation({ $0 + $1 }), // 强大的lambda表达式
            "−": Operation.BinaryOperation({ $0 - $1 }),
            // "×": Operation.BinaryOperation({ (op1, op2) in return op1 * op2 }),
            "×": Operation.BinaryOperation({ $0 * $1 }),
            "÷": Operation.BinaryOperation({ $0 / $1 }),
            "=": Operation.Equals
    ]


    private enum Operation {
        // 枚举类型
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            // switch 语句
            switch operation {
                    // case 后面 break 字段可选，省略也没关系，这是跟java不同的地方
            case .Constant(let associatedConstantValue): // 1.可以省略前面的类名;2.定义一个变量，因为是常量，所以直接使用
                accumulator = associatedConstantValue
            case .UnaryOperation(let function): // 在swift语言中，方法类型和基本类型一样，可以作为参数进行传递
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }

    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }

    private var pending: PendingBinaryOperationInfo?

    // TODO struct 又是个什么东西？

    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }

    var result: Double {
        get {
            return accumulator
        }
    }

}

