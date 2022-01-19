//
//  Day22.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/18.
//

import Foundation

/*
 【Day22】 今日打卡题目

 🌸冗余连接-684
 https://leetcode-cn.com/problems/redundant-connection/description/

 */


class Day22 {
    
    
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var parent: [Int] = Array(repeating: 0, count: edges.count + 1)
        for i in 1..<parent.count {
            parent[i] = i
        }
        
        for i in 0..<edges.count {
            let edge = edges[i]
            let rootX = edge[0]
            let rootY = edge[1]
            if find(&parent, rootX) != find(&parent, rootY) {
                union(&parent, rootX, rootY)
            } else {
                return edge
            }
        }
        
        return []
    }
    
   
    func union(_ parents: inout [Int], _ rootX: Int, _ rootY: Int)  {
        parents[find(&parents, rootX)] = find(&parents, rootY)
    }
    
    func find(_ parents: inout [Int],  _ x: Int)  -> Int {
        if parents[x] != x {
            parents[x] = find(&parents, parents[x])
        }
        return parents[x]
    }
    
    
    
    
    static func test() {
        let edges = [[1,2], [1,3], [2,3]]
        let obj = Day22()
        let res = obj.findRedundantConnection(edges)
        print("res: \(res)")
    }

    

}

