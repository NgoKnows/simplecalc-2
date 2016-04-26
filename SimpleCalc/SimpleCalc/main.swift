//
//  main.swift
//  SimpleCalc
//
//  Created by Alex Ngo on 4/4/16.
//  Copyright © 2016 Alex Ngo. All rights reserved.
//

import Foundation

func add(left: Int, right: Int) {
    print(left + right)
}

func sub(left: Int, right: Int) {
    print(left - right)
}

func mul(left: Int, right: Int) {
    print(left * right)
}

func div(left: Int, right: Int) {
    print(Float(left) / Float(right))
}

func mod(left: Int, right: Int) {
    print(left % right)
}

func count(vals: Array<String>) {
    print(vals.count)
}

func avg(vals: Array<String>) {
    var total = 0
    for val in vals {
        total += Int(val)!
    }
    
    print(Float(total) / Float(vals.count))
}

func fact(vals: Array<String>) {
    var total = 1
    if Int(vals[0])! > 0 {
        for val in 1...Int(vals[0])! {
            total = total * val
        }
    }
    
    print(total)
}

func stringIsNumber(str: String) -> Bool {
    return Int(str) != nil
}

let basicOperations: [String: (Int, Int) -> Void] = ["add": add, "sub": sub, "mul": mul, "div": div, "mod": mod]
let multiOperations: [String: (Array<String>) -> Void] = ["count": count, "avg": avg, "fact": fact]
var basicOperationSet: Set<String> = ["add", "sub", "mul", "div", "mod"]

while true {
    print("Enter input or \"exit\" to exit!")
    var left = readLine(stripNewline: true)!
    
    if left == "exit" {
        exit(0)
    }
    
    if (left.hasSuffix("count") || left.hasSuffix("avg") || left.hasSuffix("fact")) {
        var inputs = left.componentsSeparatedByString(" ")
        var method = inputs[inputs.count - 1]
        var values = Array(inputs[0...inputs.count - 2])
        
        for target in values {
            if !stringIsNumber(target) {
                print("Invalid Input!")
                exit(1)
            }
        }
        
        multiOperations[method]!(values)
        
    } else {
        var method = readLine(stripNewline: true)!
        var right = readLine(stripNewline: true)!
        
        if (!basicOperationSet.contains(method)) {
            print("Invalid Operation!")
            exit(1)
        }
        
        if !stringIsNumber(left) || !stringIsNumber(right) {
            print("Invalid Input!")
            exit(1)
        }
        
        var left_int = Int(left)!
        var right_int = Int(right)!
        
        basicOperations[method]!(left_int, right_int)
    }
}
