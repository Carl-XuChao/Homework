//
//  Test.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/2/8.
//

import Foundation


/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 */

// @lc code=start
class Solution111 {
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var sortedCoins = coins.sorted()
        sortedCoins = sortedCoins.reversed()
        if amount == 0 {
            return  0
        }
        var totalAmount = amount
        var count = 0
        print("sortedCoins: \(sortedCoins)")
        for coin in sortedCoins {
            while totalAmount >= coin {
                count += totalAmount / coin
                totalAmount = totalAmount % coin
            }
        }
        return totalAmount == 0 ? count : -1
    }
    
    static func test() {
        let obj = Solution111()
        let coins = [186,419,83,408]
        let amount = 6249
        let res = obj.coinChange(coins, amount)
        print("res: \(res)")
    }
    
}
// @lc code=end

