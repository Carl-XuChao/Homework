//
//  Day19.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/15.
//

import Foundation

/*
 【Day19】 今日打卡题目

 🌸括号生成-22
 https://leetcode-cn.com/problems/generate-parentheses/
 */


class Parenthesis {
    
//    var map: [Int: [String]] = [:]
//
//    func generateParenthesis(_ n: Int) -> [String] {
//        if n == 0 {
//            return [""]
//        }
//        if map[n] != nil {
//            return map[n]!
//        }
//        var ans: [String] = []
//        for k in 1..<n {
//            let leftArray = generateParenthesis(k - 1)
//            let rightArray = generateParenthesis(n - k)
//            for itemA in leftArray {
//                for itemB in rightArray {
//                    let item = "(" + itemA + ")" + itemB
//                    ans.append(item)
//                }
//            }
//        }
//        map[n] = ans
//        return ans
//    }
    
    
    var capcity = 0
    
    //方法一：  n对括号， 2n个字符， 选“（” 或 “）”的问题， 再进行有效
    func generateParenthesis(_ n: Int) -> [String] {
        capcity = 2 * n
        var reslut: [String] = []
        let current : [String] = Array(repeating: "", count: capcity)
        generateAll(current, pos: 0, reslut: &reslut)
        return reslut
    }
    
    func generateAll(_ current: [String], pos: Int, reslut: inout [String])  {
        var cur = current
        if pos == capcity {
            if isVailate(cur) {
                reslut.append(cur.joined(separator: ""))
            }
            return
        } else {
            cur[pos] = "("
            generateAll(cur, pos: pos + 1, reslut: &reslut)
            cur[pos] = ")"
            generateAll(cur, pos: pos + 1, reslut: &reslut)
        }
    }
    
    
    // 判断结构是否有效， 左括号的个数要大于右括号
    func isVailate(_ current: [String]) -> Bool  {
        var balance = 0
        for item in current {
            if item == "(" {
                balance += 1
            } else {
                balance -= 1
            }
            if balance < 0 {
                return false
            }
        }
        return balance == 0
    }
    
    
    
    static func test() {
        let p = Parenthesis()
        let res = p.generateParenthesis(3)
        print("res: \(res)")
    }
    
}
