//
//  Dat12.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/7.
//

import Foundation

/*
 【Day12】 今日打卡题目

 🌸最大子序和-53
 https://leetcode-cn.com/problems/maximum-subarray/

 */

class MaxSubArray {
    
    
    var sumArray: [Int] = [0]
    
    var minStack: [Int] = [0]
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        var sum = 0
        var minSum = 0
        for i in 0..<nums.count {
            // 求前缀和数组
            sum += nums[i]
            sumArray.append(sum)
            // 求前缀和大
            minSum = min(minSum, sum)
            minStack.append(minSum)
        }
        
        var maxSum = sumArray[1]
        for i in 1..<sumArray.count {
            maxSum = max(maxSum, sumArray[i] - minStack[i-1])
        }
        return maxSum
    }
    
    
    // 暴力方法，会超时
//    func maxSubArray1(_ nums: [Int]) -> Int {
//        var sum = 0
//        // 求前缀和数组
//        for i in 0..<nums.count {
//            sum += nums[i]
//            sumArray.append(sum)
//        }
//
//        var maxSum = sumArray[1]
//        // 求区间最大值 = sumArray[i] - sumArray[j]
//        for i in 1..<sumArray.count {
//            var j = 0
//            while j < i {
//                maxSum = max(maxSum, sumArray[i] - sumArray[j])
//                j += 1
//            }
//        }
//        return maxSum
//    }
    
    
//    print("max:  i:\(i) -- j:\(j) --- sumArray: \(sumArray[i] - sumArray[j])")
    
    func test() {
        let  nums = [-2,1,-3,4,-1,2,1,-5,4]
//        let nums = [5,4,-1,7,8]
//        let nums = [-1]
//        let nums = [-2,-1]
        print("nums: \(nums)")
        let res = maxSubArray(nums)
        print("sumArray: \(sumArray)")
        print("minStack: \(minStack)")
        
        print("res: \(res)")
    }
    
}

