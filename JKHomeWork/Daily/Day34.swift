//
//  Day34.swift
//  JKHomeWork
//
//  Created by GZ00043ML on 2022/1/29.
//

//import Foundation

//【Day34】 今日打卡题目
//
//🌸猜数字大小-374
//https://leetcode-cn.com/problems/guess-number-higher-or-lower/


/*
 * @lc app=leetcode.cn id=374 lang=swift
 *
 * [374] 猜数字大小
 */

// @lc code=start
/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if the picked number is lower than your guess number
 *                  1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class GuessGame {
    
    let pick = 6
    
    func guess(_ num: Int) -> Int {
        if num == pick {
            return 0
        } else if num > pick {
            return 1
        } else {
            return -1
        }
    }
}

class Solution34 : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left < right {
            let mid = left + (right - left) / 2
            if guess(mid) == -1 {
                right = mid  - 1
            } else if guess(mid) == 1 {
                left = mid + 1
            } else {
                return mid
            }
        }
        return left
    }
}
// @lc code=end

