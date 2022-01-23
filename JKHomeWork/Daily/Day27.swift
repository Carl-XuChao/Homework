//
//  Day27.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/22.
//

import Foundation

/*
 * @lc app=leetcode.cn id=329 lang=swift
 *
 * [329] 矩阵中的最长递增路径
 */

// @lc code=start
class Solution {

    // m行
    var m = 0
    // n列
    var n = 0
    // 出边数组
    var to: [[Int]] = []
    // 度
    var deg: [Int] = []
    // 最大长度
    var dist: [Int] = []

    // 广搜，拓扑排序
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        if matrix.count == 0 { return 0 }
        m = matrix.count
        n = matrix.first!.count
        if n == 0 { return 0 }

        to = Array(repeating: [], count: n * m)
        deg = Array(repeating: 0, count: n * m)
        dist = Array(repeating: 0, count: n * m)
        
        // 方向数组
        let dx = [-1, 0, 0, 1]
        let dy = [0, -1, 1, 0]
        // 建图
        for i in 0..<m {
            for j in 0..<n {
                for k in 0..<4 {
                    let ni = i + dx[k]
                    let nj = j + dy[k]
                    // 递增的点加边
                    if valid(ni, nj) && matrix[ni][nj] > matrix[i][j] {
                        addEdge(num(i, j),num(ni, nj))
                    }
                }
            }
            
        }

        var queue: [Int] = []
        for i in 0..<(m * n) {
            // 入度为0的点，就是每次点起点
            if deg[i] == 0 {
                queue.append(i)
                deg[i] = 1
            }
        }

        while !queue.isEmpty {
            let x = queue.first!
            queue.removeFirst()
            for y in to[x] {
                deg[y] -= 1
                dist[y] = max(dist[y], dist[x] + 1)
                if deg[y] == 0 {
                    queue.append(y)
                }
            }
        }

        var ans = 0
        for i in 0..<(m * n) {
            ans = max(ans, dist[i])
        }
        return ans
    }

    // 加边
    func addEdge(_ u: Int, _ v: Int) {
        deg[v] += 1
//        print("deg: v:\(v) --- deg[v]: \(deg[v])")
        to[u].append(v)
    }

    // 坐标点
    func num(_ i: Int, _ j: Int) -> Int {
         return i * n + j
    }

    // 判断数组是否越界
    func valid(_ i: Int, _ j: Int) -> Bool {
        return i >= 0 && i < m && j >= 0 && j < n
    }

    
    static func test() {
        let a = [[9,9,4],[6,6,8],[2,1,1]]
        let obj = Solution()
        let res = obj.longestIncreasingPath(a)
        print("res: \(res)")
    }
    
}
// @lc code=end


