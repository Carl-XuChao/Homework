//【Day28】 今日打卡题目
//
//🌸合并k个升序链表-23
//https://leetcode-cn.com/problems/merge-k-sorted-lists/
//
//



/*
 * @lc app=leetcode.cn id=304 lang=swift
 *
 * [304] 二维区域和检索 - 矩阵不可变
 */

// @lc code=start

class NumMatrix1 {

    var sum: [[Int]] = []

    init(_ matrix: [[Int]]) {
        let n = matrix.count
        let m = matrix[0].count
        sum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        // 二维矩阵的前缀和
        for i in 1...n {
            for j in 1...m {
                sum[i][j] = sum[i - 1][j] + sum[i][j - 1] - sum[i - 1][j - 1] + matrix[i - 1][j - 1]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let r2 = row2 + 1
        let c2 = col2 + 1
        let r1 = row1 + 1
        let c1 = col1 + 1
        return sum[r2][c2] - sum[r2][c1 - 1] - sum[r1 - 1][c2] + sum[r1 - 1][c1 - 1]
    }
    
    
    static func test() {
        
        
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
// @lc code=end




class Solution111 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var ans: [[Int]] = []
        let sortedNums = nums.sorted()
        var set = Set<String>()
        for i in 0..<sortedNums.count {
            for j in (i + 1)..<sortedNums.count {
                var l = j + 1
                var r = sortedNums.count - 1
                while l < r {
                    let res = sortedNums[i] + sortedNums[j] + sortedNums[l] + sortedNums[r]
                    if res > target {
                        r -= 1
                    } else if res < target {
                        l += 1
                    } else {
                        set.insert("\(sortedNums[i]),\(sortedNums[j]),\(sortedNums[l]),\(sortedNums[r])")
                        r -= 1
                        l += 1
                    }
                }
            }
        }
        for item in set {
            let array = item.split(separator: ",").map {Int($0) ?? 0}
            ans.append(array)
        }
        return ans
    }
    
    static func test() {
        let obj = Solution111()
        let nums = [1,0,-1,0,-2,2]
        let target = 0
        let ans = obj.fourSum(nums, target)
        print("ans: \(ans)")
    }
    
    
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        // 记录所有
    }
    
    
    
}
