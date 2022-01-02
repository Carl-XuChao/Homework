//
//  Day-7.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/2.
//

import Foundation


class MinStack {
    
    var list: [Int] = []
    
    var minList : [Int] = []

    init() {

    }
    
    func push(_ val: Int) {
        list.append(val)
        minList.append(min(minList.last ?? val, val))
    }
    
    func pop() {
        if list.isEmpty {
            return
        }
        list.removeLast()
        minList.removeLast()
    }
    
    func top() -> Int {
        return list.last ?? -1000000000000000000
    }
    
    func getMin() -> Int {
        return minList.last ?? -1000000000000000000
    }
    
    
    func test() {
        let minStack =  MinStack();
        print("minStack: \(minStack.push(-2))")
        print("minStack: \(minStack.push(0))")
        print("minStack: \(minStack.push(-3))")
        print("minStack: \(minStack.getMin())")
        print("minStack: \(minStack.pop())")
        print("minStack: \(minStack.top())")
        print("minStack: \(minStack.getMin())")
    }
    
}
