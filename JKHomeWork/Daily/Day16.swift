//
//  Day16.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/11.
//

import Foundation

/*
 【Day16】 今日打卡题目

 🌸组合-77
 https://leetcode-cn.com/problems/combinations/
 */


class Combine {
    
    var ans: [[Int]] = [ ]
    
    var chosen: [Int] = [ ]
    
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
       choseNumber(n, k)
        return ans
    }
    
    
    private func choseNumber(_ n: Int, _ k: Int)  {
        // 剪枝 终止条件
        if n == -1 || chosen.count + n < k || chosen.count > k {
            return
        }
        // 终止条件
        if chosen.count == k {
            ans.append(chosen)
            return
        }
        // 不选
        choseNumber(n - 1, k)
        // 选
        chosen.append(n)
        choseNumber(n - 1, k)
        // 清理当前层
        chosen.removeLast()
    }
    
    
    static func test() {
        let n = 1
        let k = 1
        let obj = Combine()
        let res = obj.combine(n, k)
        print("res: \(res)")
    }
    
    
}
