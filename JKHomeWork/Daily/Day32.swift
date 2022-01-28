//
//  Day32.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/28.
//

import Foundation

//【Day32】 今日打卡题目
//
//🌸Sqrt(x)-69
//https://leetcode-cn.com/problems/sqrtx/

/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] Sqrt(x)
 */

// @lc code=start
class Solution32 {
    
    // x = m * m
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        while left < right {
            // + 1 防止最后2个数据无法结束条件
            let mid = (left + right + 1) / 2
            if mid * mid <= x {
                // 左边的最大值
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }


}
// @lc code=end

