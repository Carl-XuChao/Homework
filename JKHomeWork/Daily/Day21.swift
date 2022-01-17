//
//  Day21.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/17.
//

import Foundation

/*
 【Day21】 今日打卡题目

 🌸课程表-207
 https://leetcode-cn.com/problems/course-schedule/

 */

class Day21 {
    
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // 边
        var edges: [[Int]] = Array(repeating: [], count: numCourses);
        // 入度数组
        var indeg: [Int] = Array(repeating: 0, count: numCourses)
        for item in prerequisites {
            edges[item[1]].append(item[0])
            indeg[item[0]] += 1
        }
        print("edges: \(edges)")
        print("indeg: \(indeg)")
        
        // 存入度为0的课程的队列
        var queue: [Int] = []
        for i in 0..<numCourses {
            if indeg[i] == 0 {
                queue.append(i)
            }
        }
        
        // 记录访问过的课程数据， 如果最终都访问过说明可以学完
        var visited = 0
        while !queue.isEmpty {
            visited += 1
            let u = queue.first!
            queue.removeFirst()
            for item in edges[u] {
                indeg[item] -= 1
                if indeg[item] == 0 {
                    queue.append(item)
                }
            }
            
        }
        
        return visited == numCourses;
    }

}


