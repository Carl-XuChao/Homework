//
//  Day15.swift.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/10.
//

import Foundation

/*
 【Day15】 今日打卡题目

 🌸子集-78
 https://leetcode-cn.com/problems/subsets/
 */



class Subsets {
    
    var ans: [[Int]] = []
    
    var choseArray: [Int] = [ ]
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        chooseNum(nums, 0)
        return ans
    }
    
    func chooseNum(_ nums: [Int], _ n: Int) {
        // 终结条件
        if n == nums.count {
            ans.append(choseArray)
            return
        }
        
        // 不选
        chooseNum(nums, n + 1)
        // 选
        choseArray.append(nums[n])
        chooseNum(nums, n + 1)
        
        // 还原当前层数据
        choseArray.removeLast()
    }
    
    
    static func test() {
        let s = Subsets.init()
        let  nums = [1,2,3]
        let res = s.subsets(nums)
        print("res: \(res)")
    }
    
}
