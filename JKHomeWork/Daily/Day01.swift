//
//  Day01.swift
//  HomeWork
//
//  Created by GZ05008ML on 2021/12/29.
//

import SwiftUI

/*
 【Day01】 今日打卡题目来啦
 
 🌸合并两个有序数组-88
 https://leetcode-cn.com/problems/merge-sorted-array/
 */

class MergeSortedArray {
    
    
    /// 方法一
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nums1Index: Int =  m - 1
        var nums2Index: Int =  n - 1
        // 倒叙遍历，避免正序遍历出现赋值覆盖的问题
        for var i in (0...m+n-1).reversed() {
            // 边界条件处理：nums1先空， 直接填充nums2剩下的数据
            if (nums1Index < 0 ) {
                nums1[i] = nums2[nums2Index]
                nums2Index -= 1
                continue
            }
            // 边界条件处理：nums2先空， 直接填充nums1剩下的数据
            if (nums2Index < 0 ) {
                nums1[i] = nums1[nums1Index]
                nums1Index -= 1
                continue
            }
            // 比较大小取大值赋值， 移动下标位置
            if (nums1[nums1Index] > nums2[nums2Index]) {
                nums1[i] = nums1[nums1Index]
                nums1Index -= 1
            } else {
                nums1[i] = nums2[nums2Index]
                nums2Index -= 1
            }
            i -= 1
        }
    }
    
    // test case
    func test()  {
        var a: [Int] = [1,3,6,0,0,0]
        let b: [Int] = [2,4,5]
        print(a)
        print(b)
        print("---------------")
        merge2(&a, 3, b, b.count)
        print(a)
    }
    
    
    /// 方法二：  优化判断方法， 本质上没区别
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nums1Index: Int =  m - 1
        var nums2Index: Int =  n - 1
        for var i in (0...m+n-1).reversed() {
            // 如果nums2先为空，剩下的num1就是有序
            if (nums2Index < 0) {
                break
            }
            // 如果nums1先为空， 继续把nums2的数据搬进去
            if (nums1Index < 0 || nums2Index >= 0 && (nums2[nums2Index] > nums1[nums1Index])) {
                nums1[i] = nums2[nums2Index]
                nums2Index -= 1
            } else {
                nums1[i] = nums1[nums1Index]
                nums1Index -= 1
            }
            i -= 1
        }
    }
    
    
    // test case
    func test1()  {
        var a1: [Int] = [1,2,3,0,0,0]
        let b1: [Int] = [2,4,5]
        print(a1)
        print(b1)
        print("---------------")
        merge2(&a1, 3, b1, b1.count)
        print(a1)
    }
    
    
}


/// 优化方法
extension MergeSortedArray {
    
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m + n - 1
        var num1Index = m - 1
        var num2Index = n - 1
        // 遍历完num1的数组
        while num1Index >= 0 {
            // 遇到num2比num1对应位置数据大的情况就赋值，直到小于num1, 再移动num1的下表
            while num2Index >= 0 {
                if (nums1[num1Index] < nums2[num2Index]) {
                    nums1[i] = nums2[num2Index]
                    num2Index -= 1
                    i -= 1
                } else {
                    nums1[i] = nums1[num1Index]
                    i -= 1
                    break
                }
            }
            num1Index -= 1
        }
        //  如果num2数组还有剩余，要重赋值， 如果num1数组还有剩余，不需要重新赋值。
        while num2Index >= 0 {
            nums1[num2Index] = nums2[num2Index]
            num2Index -= 1
        }
    }
    
}
