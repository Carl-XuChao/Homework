//
//  Week02.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/3.
//

import Foundation

class WeekTwo {
    
    /*  811. 子域名访问计数
     https://leetcode-cn.com/problems/subdomain-visit-count/
     */
    // 暴力 hash
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        // key: 域名， value: 出现次数
        var map: [String: Int] = [:]
        for i in 0..<cpdomains.count {
            let array = cpdomains[i].split(separator: " ")
            if array.count == 2 {
                let num = Int(array.first!)
                let domainName = String(array.last!)
                let domainArray = domainName.split(separator: ".")
                var sumDomainStr = ""
                var index = domainArray.count - 1
                while index >= 0 {
                    sumDomainStr = index == domainArray.count - 1 ? String(domainArray[index]) : domainArray[index] + "." + sumDomainStr
                    map[sumDomainStr] =  (map[sumDomainStr] ?? 0) + num!
                    index -= 1
                }
            }
        }
        let list =  map.map { item in
            return String(item.value) + " " + String(item.key)
        }
        return list
    }
    
    
    /* 697. 数组的度
     https://leetcode-cn.com/problems/degree-of-an-array/
     */
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var map: [Int: [Int]] = [:]
        var countMap: [Int: Int] = [:]
        // 先找出每个数出现的频次
        for i in 0..<nums.count {
            let item = nums[i]
            if map[item] != nil {
                map[item]!.append(i)
                countMap[item]! += 1
            } else {
                map[item] = [i]
                countMap[item] = 1
            }
        }
        
        var ans: Int = 50000
        var maxCount = 0
        // 找出出现频率最高的数据
        for (item, count) in countMap {
            let length = map[item]!.last! - map[item]!.first! + 1
            if count > maxCount {
                maxCount = count
                // 取最大值的长度
                ans = length
            } else if count == maxCount {
                // 相等的情况，取最小值
                ans = min(length, ans)
            }
        }
        return ans
    }
    

    
    
    /* 560. 和为 K 的子数组
     https://leetcode-cn.com/problems/subarray-sum-equals-k/
     */
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        var preSumArray: [Int] = [0]
        // 前缀和， 注意补0
        var sum = 0
        for item in nums {
            sum += item
            preSumArray.append(sum)
        }
        var count = 0
        // pre[i]−pre[j−1]==k  就是从j到i的区间和
        for i in 0..<preSumArray.count {
            for j in 0..<i {
                if preSumArray[i] - preSumArray[j] == k {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // 前缀和
        var prefixSum: Int = 0
        // 当前位置的前缀和
        var count = 0
        // 前缀和值：次数
        var map: [Int: Int] = [0:1]
        // pre[i]−pre[j−1]==k  && j < i
        for i in 0..<nums.count {
            prefixSum += nums[i]
            if map[prefixSum - k] != nil {
                count += map[prefixSum - k]!
            }
            map[prefixSum] =  (map[prefixSum] ?? 0) + 1
        }
        return count
    }
    
    
    
    /* 1074. 元素和为目标值的子矩阵数量
     https://leetcode-cn.com/problems/number-of-submatrices-that-sum-to-target/
     */
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        
        return 0
    }
}


