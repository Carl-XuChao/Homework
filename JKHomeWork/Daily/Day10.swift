//
//  Day10.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/5.
//

import Foundation

/*
 【Day10】 今日打卡题目
 
 🌸LRU缓存机制-146
 https://leetcode-cn.com/problems/lru-cache/
 
 做完题目后，你需要：
 1、将代码截图发到群里
 2、在刷题打卡登记表里登记，班班能核对到你们的打卡记录
 👉https://jinshuju.net/f/lLWx1u
 */


class LRUCache {
    
    var capacity = 0
    
    // 存key
    var list: [Int]  = []
    
    // key: value
    var map: [Int: Int] = [:]
    

    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let value = map[key]  {
            // 当前值移动位置到数组最前面
            if let index = list.firstIndex(of: key) {
                list.remove(at: index)
                list.insert(key, at: 0)
            }
            return value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int)  {
        // 数组容量满了，先删除最后数据，再更新新的key
        if list.count == capacity && map[key] == nil {
            // 移除最末尾元素
            if let last = list.last {
                map.removeValue(forKey: last)
            }
            list.removeLast()
        }
        
        // 数组中已经存在key, 需要移动key到数组最前面
        if map[key] != nil  {
            // 当前值移动位置到数组最前面
            if let index = list.firstIndex(of: key) {
                list.remove(at: index)
                list.insert(key, at: 0)
            }
        } else {
            list.insert(key, at: 0)
        }
        
        map[key] = value
    }
    
    
    static func test() {
        let l =  LRUCache(2)
        l.put(1, 1); // 缓存是 {1=1}
        l.put(2, 2); // 缓存是 {1=1, 2=2}
        print("\(l.get(1))") ;    // 返回 1
        l.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
        print("\(l.get(2))") ;    // 返回 -1 (未找到)
        l.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
        print("\(l.get(1))") ;    // 返回 -1 (未找到)
        print("\(l.get(3))") ;    // 返回 3
        print("\(l.get(4))") ;    // 返回 4
        
    }
    
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
