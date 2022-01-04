//
//  Day09.swift
//  JKHomeWork
//
//  Created by GZ05008ML on 2022/1/4.
//

import Foundation


/*
 【Day09】 新年快乐，坚持做题嗷🧨

 🌸字母异位词分组-49
 https://leetcode-cn.com/problems/group-anagrams/

 做完题目后，你需要：
 1、将代码截图发到群里
 2、在刷题打卡登记表里登记，班班能核对到你们的打卡记录
 👉https://jinshuju.net/f/lLWx1u
 */
class GroupAnagrams {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        // 遍历
        for item in strs {
            // 将当前单词按照升序排列
            let orderKey = sort(str: item)
            // 查找是否存在异位词
            if map[orderKey] != nil {
                map[orderKey]?.append(item)
            } else {
                map[orderKey] = [item]
            }
        }
        var result: [[String]] = []
        for (_, value) in map {
            result.append(value)
        }
        return result
    }
    
    func sort(str: String) -> String {
        var orderStr = ""
        for item in str.sorted() {
            orderStr += String(item)
        }
       return orderStr
    }
    
    
    
    
    func test()  {
//        输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
//        输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
        let a = ["eat", "tea", "tan", "ate", "nat", "bat"]
        let res = groupAnagrams(a)
        print("groupAnagrams:  \(res)")
    }
    
}
