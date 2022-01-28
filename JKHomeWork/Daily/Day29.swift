//
//  Day29.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/28.
//

import Foundation

//【Day29】 今日打卡题目
//
//🌸滑动窗口最大值-239
//https://leetcode-cn.com/problems/sliding-window-maximum/


/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 */

// @lc code=start
class Solution29 {

//  遍历给定数组中的元素，如果队列不为空且当前考察元素大于等于队尾元素，则将队尾元素移除。直到，队列为空或当前考察元素小于新的队尾元素；
// 当队首元素的下标小于滑动窗口左侧边界left时，表示队首元素已经不再滑动窗口内，因此将其从队首移除。
// 由于数组下标从0开始，因此当窗口右边界right+1大于等于窗口大小k时，意味着窗口形成。此时，队首元素就是该窗口内的最大值。
    
    static func test() {
        let obj = Solution29()
        let arr = [1,3,-1,-3,5,3,6,7]
        let res = obj.maxSlidingWindow(arr, 3)
        print("res: \(res)")
    }

    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        // 存数字
        var ans: [Int] = []
        // 存下表
        var queue: [Int] = []
        var left = 0
        var right = 0
        for i in 0..<nums.count {
            // 0-0 0-1 0-2  1-3
            left = i - k + 1 < 0 ? 0 : i - k + 1
            right = i
            // 单调递减入队
            if queue.isEmpty {
                queue.append(i)
            } else {
                var index = queue.last!
                // 将要入队元素比对队尾大， 队尾元素出队, 注意>=!!!
                while queue.count > 0 && nums[i] >= nums[index] {
                    queue.removeLast()
                    if let last = queue.last {
                        index = last
                    } else {
                        break
                    }
                }
                queue.append(i)
            }
            
            // 满窗口
            if right - left + 1 == k {
                // 队列小于left的从头部出队
                var firstIndex = queue.first!
                while queue.count > 0 && firstIndex < left {
                    queue.removeFirst()
                    if let first = queue.first {
                        firstIndex = first
                    } else {
                        break
                    }
                }
                 if queue.count > 0 {
                    ans.append(nums[queue[0]])
                }
            }
        }

        return ans
    }

}
// @lc code=end


// 方法二： 维护一个堆
