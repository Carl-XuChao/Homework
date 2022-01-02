//
//  Day05.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/1.
//

import Foundation

/*
 【Day05】 今日打卡题目来啦
 
 🌸有效的括号-20
 https://leetcode-cn.com/problems/valid-parentheses/
 
 做完题目后，你需要：
 1、将代码截图发到群里
 2、在刷题打卡登记表里登记，班班能核对到你们的打卡记录
 👉https://jinshuju.net/f/lLWx1u
 */


class ValidParentheses {
    
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        let leftArr: [String.Element] = ["(", "[", "{"];
        let rightArr: [String.Element] = [")", "]", "}"];
        let map: [String.Element: String.Element] = ["(": ")","[":"]","{":"}"]
        var stackArray: [String.Element] = []
        for item in s {
            if leftArr.contains(item) {
                stackArray.append(item)
            }
            if rightArr.contains(item) {
                guard let top = stackArray.last else { return false }
                if map[top] == item {
                    stackArray.removeLast()
                } else {
                    return false
                }
            }
        }
        return stackArray.isEmpty
    }
    
    
    // 耗时比方法一还长
    func isValid2(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        let map: [String.Element: String.Element] = ["(": ")","[":"]","{":"}"]
        var stackArray: [String.Element] = []
        for item in s {
            if map[item] != nil { // 左括号进栈
                stackArray.append(item)
            } else { // 右括号匹配出栈
                guard let top = stackArray.last else { return false }
                if (map[top] == item) {
                    stackArray.removeLast()
                } else {
                    return false
                }
            }
        }
        return stackArray.isEmpty
    }
    
}
