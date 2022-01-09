//
//  Day14.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/9.
//

import Foundation


/*
 【Day14】 今日打卡题目

 🌸盛最多水的容器-11
 https://leetcode-cn.com/problems/container-with-most-water/
 */

class MaxArea {
    
    
    func maxArea(_ height: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = height.count - 1
        var maxArea = 0
        while leftIndex < rightIndex {
            let width = rightIndex - leftIndex
            let h = min(height[rightIndex], height[leftIndex])
            maxArea = max(maxArea, width * h)
            if (height[leftIndex] > height[rightIndex]) {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }
        return maxArea
    }
    
    
    static func test() {
        let heights = [1,8,6,2,5,4,8,3,7]
        let area = MaxArea().maxArea(heights)
        print("area: \(area)")
    }
    
    
}
