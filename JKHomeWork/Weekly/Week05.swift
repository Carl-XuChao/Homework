//
//  Week05.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/29.
//

import Foundation

class WeekFive {
    
    
    /*
     * @lc app=leetcode.cn id=1011 lang=swift
     *
     * [1011] 在 D 天内送达包裹的能力
     */

    // @lc code=start
    class Solution {
        func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
            // 运载量的取值范围是从0到最大值
            var left = 0
            var right = 0
            for i in 0..<weights.count {
                left = max(left, weights[i])
                right += weights[i]
            }
            while left < right {
                let mid = (left + right) / 2
                // 判断条件
                if isValid(weights, days, mid) {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }

        // 判断条件有点难
        func isValid(_ weights: [Int], _ days: Int, _ minWeight: Int) -> Bool {
            var count = 1
            var sum = 0
            for i in 0..<weights.count {
               if sum + weights[i] > minWeight {
                  sum = 0
                  count += 1
               }
               sum += weights[i]
            }
            return count <= days
        }
    }
    // @lc code=end


    /*
     * @lc app=leetcode.cn id=875 lang=swift
     *
     * [875] 爱吃香蕉的珂珂
     */

    // @lc code=start
    class Solution1 {
        func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
            // 假设每小时吃香蕉速度为x
            // 每堆需要吃的时间 piles[i] / x + (piles[i] % x == 0 ? 0 : 1)
            // 之和要小于等于 h
            var left = 1
            var right = 0
            for item in piles {
                right += item
            }
            while left < right {
                let mid = (left + right) / 2
                if isValid(piles, h, mid) {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }

        func isValid(_ piles: [Int], _ h: Int, _ speed: Int) -> Bool {
            var totalHour = 0
            for item in piles {
                let hour = item / speed + (item % speed == 0 ? 0 : 1)
                totalHour += hour
            }
            return totalHour <= h
        }

    }
    // @lc code=end



    /*
     * @lc app=leetcode.cn id=911 lang=swift
     *
     * [911] 在线选举
     */

    // @lc code=start

    class TopVotedCandidate {

        var persons: [Int] = []
        var times: [Int] = []

        //  编号： 投票数
        var result: [Int: Int] = [:]

        var maxPerson: [Int] = []

        // 应该是要借助大顶堆去实现， swift没有
        init(_ persons: [Int], _ times: [Int]) {
            self.persons = persons
            self.times = times
            var maxCount = 0
            for i in persons {
                if result[i] != nil {
                    result[i]! += 1
                } else {
                     result[i] = 1
                }
                maxCount = max(maxCount, result[i]!)
                if result[i]! == maxCount {
                    maxPerson.append(i)
                } else {
                    maxPerson.append(maxPerson.last!)
                }
            }
        }
        
        func q(_ t: Int) -> Int {
            var count = 0
            for i in times {
                if t >= i {
                    count += 1
                } else {
                    break
                }
            }
            return count > 1 ? maxPerson[count - 1] : persons[0]
        }
        
        
        static func test() {
//            '[[[0,0,1,1,2],[0,67,69,74,87]],[4],[62],[100],[88],[70],[73],[22],[75],[29],[10]]

//            let p = [0, 1, 1, 0, 0, 1, 0]
//            let t = [0, 5, 10, 15, 20, 25, 30]
            let p = [0,0,1,1,2]
            let t = [0,67,69,74,87]
            let obj = TopVotedCandidate(p, t)
            
            let res = obj.q(100)
            print("res: \(res)")
        }
        
    }

    /**
     * Your TopVotedCandidate object will be instantiated and called as such:
     * let obj = TopVotedCandidate(persons, times)
     * let ret_1: Int = obj.q(t)
     */
    // @lc code=end



    
}
