//
//  Model.swift
//  IntCalculatorMikeEllard
//
//  Created by Rescue Mission Software on 1/27/15.
//
//

import Foundation

enum Operation: Int {
    case Add = 100
    case Subtract = 101
    case Multiply = 102
    case Divide = 103
    case Remainder = 104
}

func add(augend: Int, addend: Int) -> String {
    
    return "\(augend + addend)"
}

func subtract(minuend: Int, subtrahend: Int) -> String {
    
    return "\(minuend - subtrahend)"
}

func multiply(multiplicand: Int, multiplier: Int) -> String {
    
    return "\(multiplicand * multiplier)"
}

func divide(dividend: Int, divisor: Int) -> String {
    
    return "\(dividend / divisor)"
}

func remainder(dividend: Int, divisor: Int) -> String {
    
    return "\(dividend % divisor)"
}


