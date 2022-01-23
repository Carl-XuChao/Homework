//
//  Day25.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/20.
//

import Foundation

/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 */

// @lc code=start
class Day25 {

    var row: Int = 0
    var col: Int = 0
    var visited: [[Bool]] = []
    var grid: [[Character]] = []

    func numIslands(_ grid: [[Character]]) -> Int {
        self.grid = grid
        row = grid.count
        col = grid.first!.count
        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        var ans = 0
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == "1" && !visited[i][j] {
                    ans += 1
                    bsf(i, j)
                }
            }
        }
        return ans
    }

    func bsf(_ sx: Int, _ sy: Int) {
        var queue:[[Int: Int]] = []
        // 方向： 左，上， 下， 右 移动一位时， x轴增量
        let dx = [-1, 0, 0, 1]
        let dy = [0,-1, 1, 0]
        queue.append([sx: sy])
        visited[sx][sy] = true
        while !queue.isEmpty {
            // 第一步： 取对头出对
            let x = queue.first!.keys.first
            let y = queue.first!.values.first
            queue.removeFirst()
            // 第二步： 扩展对头
            for i in 0..<4 {
                let nx = Int(x!) + dx[i]
                let ny = Int(y!) + dy[i]
                // 防止下标越界
                if nx < 0 || nx >= row || ny < 0 || ny >= col {
                    continue
                }
                if grid[nx][ny] != "1" || visited[nx][ny]{
                    continue
                }
                queue.append([nx: ny])
                visited[nx][ny] = true
            }
        }
    }

}
// @lc code=end

