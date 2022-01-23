//
//  Day26.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/21.
//

import Foundation

/*
 * @lc app=leetcode.cn id=433 lang=swift
 *
 * [433] 最小基因变化
 */

// @lc code=start
class Day26 {

    var depthMap: [String: Int] = [:]
    
    var hashBank: Set<String> = []

    
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        depthMap[start] = 0
        for item in bank {
            hashBank.insert(item)
        }
        // 目标基因不做基因库， 返回-1
        if !hashBank.contains(end) {
            return -1
        }
        var q: [String] = []
        q.append(start)
        let gene: [String] = ["A", "C", "G", "T"]
        while !q.isEmpty {
            let s = q.first!
            q.removeFirst()
            for i in 0..<8 {
                for j in 0..<4 {
                    var ns = s.copy() as! String
                    let startIndex = ns.index(ns.startIndex, offsetBy:i)
                    ns.replaceSubrange(startIndex..<startIndex, with: gene[j])
                
                    // 不在基因库， continue
                    if !hashBank.contains(ns) {
                        continue
                    }
                    // 每个点只需要访问一次， 第一次就是最少的层数
                    if depthMap[ns] != nil {
                        continue
                    }
                    depthMap[ns] = (depthMap[s] ?? 0) + 1
                    q.append(ns)
                    if ns == end {
                        return depthMap[ns] ?? 0
                    }
                }
            }
        }
        return -1
    }
    
}
// @lc code=end

