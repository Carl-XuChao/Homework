//
//  Day23.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/18.
//

import Foundation

/*
 【Day23】 今日打卡题目

 🌸电话号码的字母组合-17
 https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/

 */
class Day23 {
    
    let alphabet: [String.Element : String] = ["2":"abc", "3":"def", "4":"ghi","5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"]
    
    var digits = ""
    
    var ans: [String] = []
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        self.digits = digits
        dfs(0, "")
       return ans
    }
    
    func dfs(_ index: Int, _ str: String)  {
        if index == digits.count {
            ans.append(str)
            return
        }
        let digitsArray = digits.map{ $0 }
        let item = digitsArray[index]
        if let alphabet = alphabet[item] {
            for ch in alphabet {
                dfs(index + 1, str + String(ch))
            }
        }
    }
    
    
    
    
    
}
