//
//  Day13.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/8.
//

import Foundation

/*
 【Day13】 今日打卡题目

 🌸三数之和-15
 https://leetcode-cn.com/problems/3sum/
 
 */

class ThreeSum {
    

    // 存数组元素的拼接字符串: [对应下标]
    var res: [String: [Int]] = [:]

    
    ///  耗时太高了！！
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        for i in 0..<nums.count {
            let target = -nums[i]
            twoSum(nums, target: target, targetIndex: i)
        }
      
        let ans = res.values.map { indexs in
            return [nums[indexs[0]], nums[indexs[1]], nums[indexs[2]]]
        }
        print("res: \(res)")
        return ans
     }

    
    

    /// 两数之和
    func twoSum(_ nums: [Int], target: Int, targetIndex: Int) {
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            let a = nums[i]
            let b = target - a
            if map[b] != nil {
                // 值去重复
                let key = getKeys([a, b], target: target)
                // 下标去重
                let isIndexduplice = i != map[b]! && i != targetIndex && targetIndex !=  map[b]!
                if (res[key] == nil && isIndexduplice) {
                    res[key] = [targetIndex, i, map[b]!]
                }
            } else {
                map[a] = i
            }
        }
    }



    // 用值组合作为key
    func getKeys(_ nums: [Int], target: Int) -> String {
        var a = nums
        a.append(-target)
        let b = a.sorted()
        var array: [String] = []
        for item in b {
            array.append("\(item)")
        }
        return array.joined(separator: "/")
    }

    
    
    static func test() {
        let three = ThreeSum()
        let nums = [-1,0,1,2,-1,-4]
//        let nums = [0]
        print("input: \(nums)")
        let ans = three.threeSum(nums)
        print("ans: \(ans)")
    }
    
}



extension  ThreeSum {
 
    
        func threeSum(_ nums: [Int]) -> [[Int]] {
            // 不足三个数
            if nums.count < 3 {
                return []
            }
            let sortedArray = nums.sorted()
            print("sortedArray: \(sortedArray)")
            // 最小值大于0或者最大值小于0
            if sortedArray.first! > 0 || sortedArray.last! < 0 {
                return []
            }
            var ans: [[Int]] = []
    
            for  i in 0..<sortedArray.count {
                if i > 0 && sortedArray[i] == sortedArray[i-1] {
                    continue
                }
                var leftIndex = i + 1
                var rightIndex = sortedArray.count - 1
                while leftIndex < rightIndex {
                    let sum = sortedArray[i] + sortedArray[leftIndex] + sortedArray[rightIndex]
                    if (sum > 0){
                        rightIndex -= 1
                    } else if (sum < 0) {
                        leftIndex += 1
                    } else {
                        ans.append([sortedArray[leftIndex], sortedArray[i], sortedArray[rightIndex]])
                        while leftIndex < rightIndex && sortedArray[leftIndex] == sortedArray[leftIndex+1] {
                            leftIndex += 1
                        }
                        while rightIndex > leftIndex && sortedArray[rightIndex] == sortedArray[rightIndex-1] {
                            rightIndex -= 1
                        }
                        leftIndex += 1
                        rightIndex -= 1
                    }
                }
    
            }
    
            return ans
         }
    
}


