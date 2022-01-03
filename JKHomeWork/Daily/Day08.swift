//
//  Day08.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/3.
//

import Foundation

/* 1. 两数之和
 https://leetcode-cn.com/problems/two-sum/description/
 */
class TwoSum {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 数字： 下标
        var map: [Int: Int] = [:]
        var index = 0
        for item in nums {
            if (map[target - item] != nil) {
                return [map[target - item]!, index]
            } else {
                map[item] = index
            }
            index += 1
        }
        return []
    }
    
    
    func test() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print("result: \(result)")
    }
    
}
