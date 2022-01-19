//
//  Day24.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/19.
//

import Foundation


/*
 * @lc app=leetcode.cn id=51 lang=swift
 *
 * [51] N 皇后
 */


// @lc code=start
class Day24 {

    var n = 0
    // 列
    var used: [Bool] = []
    // 主对角线
    var mainUsed: [Int: Bool] = [:]
    //  副对角线
    var crossUsed: [Int: Bool] = [:]
    // 临时存储变量
    var p: [Int] = []
    // 答案数组
    var answer: [[Int]] = []

    func solveNQueens(_ n: Int) -> [[String]] {
        self.n = n
        used = Array(repeating: false, count: n)
        dfs(0)
        
        var res: [[String]] = []
        for item in answer {
            var tmp: [String] = []
            for num in item {
                var a = Array(repeating: ".", count:n)
                a[num] = "Q"
                tmp.append(a.joined(separator: ""))
            }
            res.append(tmp)
        }
        return res
    }

    /// 递归全排列
    func dfs(_ row: Int) { // 每行递增
        if row == n {
            answer.append(p)
            return
        }
        for col in 0..<n { // 每列递增
            if !used[col] && !(mainUsed[col + row] ?? false) && !(crossUsed[row - col] ?? false) {
                p.append(col)
                used[col] = true
                mainUsed[col + row] = true
                crossUsed[row - col] = true
                dfs(row + 1)
                // 还原现场
                p.removeLast()
                used[col] = false
                mainUsed[col + row] = false
                crossUsed[row - col] = false
            }
        }
    }
   
}
// @lc code=end


/*
题解： 全排列膜板 + 条件限制
每行： 不能重复
每列： 不能重复
主对角线： i - j = 0
副对角线： i + j = n
*/
