//
//  WeekSeven.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/2/19.
//

import Foundation

class WeekSeven {
    

    
    /*
     * @lc app=leetcode.cn id=279 lang=swift
     *
     * [279] 完全平方数
     */

    // @lc code=start
    class Solution1 {
        func numSquares(_ n: Int) -> Int {
            var dp = Array(repeating: 0, count: n + 1)
            for i in 1...n {
                // 全部由1组成的情况
                dp[i] = i
                var j = 1
                while i - j * j >= 0 {
                    // dp[i] 由 dp[i - j * j] 转移而来
                    dp[i] = min(dp[i], dp[i - j * j] + 1)
                    j += 1
                }
            }
            return dp[n]
        }
    }
    // @lc code=end


    
    /*
     * @lc app=leetcode.cn id=55 lang=swift
     *
     * [55] 跳跃游戏
     */

    // @lc code=start
    class Solution {

        // 方法一： 使用额外数组记录对应位置下标是否可以访问
        // func canJump(_ nums: [Int]) -> Bool {
        //     var visited = Array(repeating: false, count: 1000000)
        //     // 只有一个数， 第一步就到了
        //     if nums.count == 1 {
        //         return true
        //     }
        //     visited[0] = nums[0] > 0
        //     // 只需要走到倒数第二的位置
        //     for i in 0..<nums.count - 1 {
        //         // 前一步可以走到位置，并且当前步要大于0
        //         if  visited[i] && nums[i] > 0 {
        //             for j in 0...nums[i] {
        //                 visited[i + j] = true
        //             }
        //             // 发现有走到最后一步位置的情况，就终止循环
        //             if visited[nums.count - 1] == true {
        //                 return true
        //             }
        //         }
        //     }
        //     return visited[nums.count - 1] == true
        // }


        // 方法二： 贪心算法
        // func canJump(_ nums: [Int]) -> Bool {
        //     if nums.count == 1 {
        //         return true
        //     }
        //     var step = nums.count - 1
        //     var index = nums.count - 1
        //     while index >= 0 {
        //         if nums[index] + index >= step {
        //             step = index
        //         }
        //         index -= 1
        //     }
        //     return step == 0
        // }


        /* 方法三： 贪心
        根据题目的描述，只要存在一个位置 xx，它本身可以到达，即x+nums[x]≥y，那么位置 y 也可以到达。
        */
        func canJump(_ nums: [Int]) -> Bool {
          let n = nums.count
          var maxLenth = 0
          for i in 0..<n {
              if i <= maxLenth {
                maxLenth = max(maxLenth, i + nums[i])
                if maxLenth >= n - 1 {
                    return true
                }
              }
          }
          return false
        }


    }
    // @lc code=end


    
}
