//
//  Day31.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/28.
//

import Foundation

//【Day31】 今日打卡题目
//
//🌸在排序数组中查找元素的第一个和最后一个位置-34
//https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/


/*
 * @lc app=leetcode.cn id=34 lang=swift
 *
 * [34] 在排序数组中查找元素的第一个和最后一个位置
 */

// @lc code=start
class Solution31 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var ans: [Int] = []
        // 查找第一个小于等于8的,  right往前移动
        var l = 0
        var r = nums.count
        while l < r {
            let mid = (l + r ) / 2
            if nums[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        print("l: \(l) -- r: \(r)")
        if (r ==  nums.count || nums[r] != target) {
            ans.append(-1)
        } else {
            ans.append(r)
        }
        
        // 查找最后一个大于等于8, left往后移动
        var left = -1
        var right = nums.count - 1
        while left < right {
            let mid = (left + right + 1) / 2
            if nums[mid] <= target {
                left = mid
            } else {
                right = mid - 1
            }
        }
        print("left: \(left) right: \(right)")
        if (left ==  -1 || nums[left] != target) {
            ans.append(-1)
        } else {
            ans.append(left)
        }
        return ans
    }
}
// @lc code=end

