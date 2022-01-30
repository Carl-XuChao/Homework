//
//  Day33.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/28.
//

import Foundation

//【Day33】 今日打卡题目
//
//🌸寻找峰值-162
//https://leetcode-cn.com/problems/find-peak-element/


/*
 * @lc app=leetcode.cn id=162 lang=swift
 *
 * [162] 寻找峰值
 */

// @lc code=start
class Solution33 {
    
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let lmid = (left + right) / 2
            let rmid = lmid + 1
            if nums[lmid] <= nums[rmid] {
                left = lmid + 1
            } else {
                right = rmid - 1
            }
        }
        return left
    }
}
// @lc code=end

