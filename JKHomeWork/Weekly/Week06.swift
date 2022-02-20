//
//  Week05.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/2/19.
//

import Foundation

class WeekSix {
    
    /*
     * @lc app=leetcode.cn id=70 lang=swift
     *
     * [70] 爬楼梯
     */

    // @lc code=start
    class Solution {

        var map: [Int: Int] = [:]

        // 方法一： 递归方法
        func climbStairs(_ n: Int) -> Int {
            // f(n) = f(n - 1) + f(n - 2)
            if n == 1 {
                return 1
            }
            if n == 2 {
                return 2
            }
            if map[n] != nil {
                return map[n]!
            } else {
                let res = climbStairs(n - 1) + climbStairs(n - 2)
                map[n] = res
                return res
            }
            
        }

        // 方法二： 直接for循环
        func climbStairs1(_ n: Int) -> Int {
            // f(n) = f(n - 1) + f(n - 2)
            // f(1) = 1; f(2) = 2;
            // f(3) = f(2) + f(1)
            var f1 = 0
            var f2 = 1
            for _ in 1...n {
                let tmp = f1
                f1 = f2
                f2 = f2 + tmp
                print("\(n) --- \(f1) = \(f2)")
            }
            return f2
        }
    }
    // @lc code=end


    /*
     * @lc app=leetcode.cn id=120 lang=swift
     *
     * [120] 三角形最小路径和
     */

    // @lc code=start
    class Solution1 {
        //     状态转移方程为：
        // f[i][j] = \min(f[i-1][j-1], f[i-1][j]) + c[i][j]
        // f[i][j]=min(f[i−1][j−1],f[i−1][j])+c[i][j]

        func minimumTotal(_ triangle: [[Int]]) -> Int {
            let n = triangle.count
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
            var i = n - 1
            while i >= 0 {
                for j in 0...i {
                    dp[i][j] = min(dp[i + 1][j], dp[i + 1][j + 1]) + triangle[i][j]
                }
                i -= 1
            }
            return dp[0][0]
        }
    }
    // @lc code=end




    
}
