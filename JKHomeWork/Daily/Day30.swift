//
//  Day30.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/28.
//

import Foundation
//
//【Day30】 今日打卡题目
//
//🌸二分查找-704
//https://leetcode-cn.com/problems/binary-search/


/*
 * @lc app=leetcode.cn id=704 lang=swift
 *
 * [704] 二分查找
 */

// @lc code=start
class Solution30 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left: Int = 0
        // nums.count - 1
        var right: Int = nums.count - 1
        // <= 数组排除只有一个元素的情况
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}
// @lc code=end

