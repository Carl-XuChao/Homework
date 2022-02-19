//
//  WeekSeven.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/2/19.
//

import Foundation

class WeekSeven {
    
    class Solution {
        func rob(_ nums: [Int]) -> Int {
            let n = nums.count
            var numsArray = nums
            numsArray.insert(0, at: 0)

            var f = Array(repeating: Array(repeating: Int.min, count: 2), count: n + 1)
            f[0][0] = 0

            for i in 1...n {
                for j in 0..<2 {
                    f[i][0] = max(f[i - 1][0], f[i - 1][1])
                    f[i][1] = f[i - 1][0] + numsArray[i]
                }
            }

            return max(f[n][0], f[n][1])
        }
    }
    
}
