//
//  Week04.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/23.
//

import Foundation
import UIKit


/*
 * @lc app=leetcode.cn id=130 lang=swift
 *
 * [130] 被围绕的区域
 */

// @lc code=start
class Solution3 {
    // 右左上下
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    // 行
    var n: Int = 0
    // 列
    var m: Int = 0
   

    func solve(_ board: inout [[Character]]) {
        if board.count == 0 {
            return
        }
        n = board.count
        m = board.first!.count
        var queue: [[Int : Int]] = []
        // 边界为0点点入队列， 以他们为起点开始遍历， 连续的就是不可能被包围的O
        for i in 0..<n {
            if board[i][0] == "O" {
                queue.append([i: 0])
                board[i][0] = "A"
            }
            // 注意这里不能用else if合并
            if board[i][m - 1] == "O" {
                queue.append([i: m - 1])
                board[i][m - 1] = "A"
            }
        }
        for j in 1..<m {
            if board[0][j] == "O" {
                queue.append([0: j])
                board[0][j] = "A"
            }
            // 注意这里不能用else if合并
            if board[n - 1][j] == "O" {
                queue.append([n - 1 : j])
                board[n - 1][j] = "A"
            }
        }
        
        print("board -- 替换四边界的O点:  \(board)")
        
        //  以边界为A的点为起点进行深搜， 相连接的点标记为A
        while !queue.isEmpty {
            let x = queue.first!.keys.first!
            let y = queue.first!.values.first!
            queue.removeFirst()
            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]
                if nextX < 0 || nextX >= n || nextY < 0 || nextY >= m || board[nextX][nextY] != "O" {
                    continue
                }
                queue.append([nextX : nextY])
                board[nextX][nextY] = "A"
            }
        }

        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "A" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    
    static func test() {
        var board: [[Character]] = [["X","O","X"],["O","X","O"],["X","O","X"]]
        let obj = Solution3()
        obj.solve(&board)
        print("board -- result :  \(board)")
    }
    
    
}
// @lc code=end



/*
 * @lc app=leetcode.cn id=355 lang=swift
 *
 * [355] 设计推特
 */

// @lc code=start

//class User {
//
//    var userId: Int
//
//    var followList: [Int] = []
//
//    var articleList: [Message] = []
//
//    init(_ userId: Int) {
//        self.userId = userId
//    }
//
//    class Message {
//        var order: Int
//        var tweetId: Int
//        init(_ tweetId: Int, _ order: Int) {
//            self.tweetId = tweetId
//            self.order = order
//        }
//    }
//
//}


class Twitter {
    
    var order = 0

    class Message {
        var order: Int
        var tweetId: Int
        var userId: Int
        
        init(_ userId: Int, _ tweetId: Int, _ order: Int) {
            self.userId = userId
            self.tweetId = tweetId
            self.order = order
        }
    }
    
    // userId : tweetId
    var articleList: [[Int: [Twitter.Message]]] = []

    // userId : [userId]
    var followList: [Int: [Int]] = [:]

    init() {

    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
//        order += 1
//        let msg = Message(userId, tweetId, order)
//        if articleList[userId] != nil {
//            articleList[userId]
//        }
//        articleList.insert([userId: msg], at: 0)
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
//        let focusUserId = followList[userId] ?? []
//        var count = 0
        var ans: [Int] = []
//        for item in articleList {
//            if count == 10 {
//                return ans
//            }
//            let uId = item.keys.first!
//            let tId = item.values.first!
//            if focusUserId.contains(uId) || uId == userId {
//                ans.append(tId)
//            }
//            count += 1
//        }
        return ans
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        if followList[followerId] != nil {
            followList[followerId]!.append(followeeId)
        } else {
            followList[followerId] = [followeeId]
        }
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        if let list = followList[followerId], let index = list.firstIndex(of: followeeId) {
            followList[followerId]!.remove(at: index)
        }
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
// @lc code=end





class Solution4 {

    var sum = 0

    func convertBST(_ root: TreeNode?) -> TreeNode? {
        bsf(root)
        return root
    }

    func bsf(_ root: TreeNode?)  {
        if root == nil {
            return
         }
         bsf(root!.right)
         root!.val += sum
         sum = root!.val
         bsf(root!.left)
    }

}
