//
//  ViewController.swift
//  JKHomeWork
//
//  Created by GZ05008ML on 2021/12/30.
//

import UIKit

//Xcode快捷键： https://www.cnblogs.com/jys509/p/4358950.html

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//                mergeSortedArray()
        //
        //        revertLinkNode()
        
        //        validParentheses()
        
        //        reverseKGroup()
        
        //        mergeTwoLinkList()
        
        //        myCircularDeque()
        
//        minStack()
        
//        twoSum()
        
//        groupAnagrams()
        
//        lRUCache()
        
//        numMatrix()
        
//        maxSubArray()
        
//        ThreeSum.test()
        
        
//        subdomainVisits()
        
//        findShortestSubArray()
        
//        subarraySum()
        
        MaxArea.test()
    }
    
    
//
    
    
    
    func subarraySum() {
        let w = WeekTwo()
//        let nums = [1,1,1]
//        let k = 2
//        let nums = [1,2,3]
//        let k = 3
//        let nums = [1]
//        let k = 0
        let nums = [1,-1,0]
        let k = 0
        let res = w.subarraySum(nums, k)
        print("res: \(res)")
        let res1 = w.subarraySum1(nums, k)
        print("res1: \(res1)")
    }
    
    
    func subdomainVisits() {
        let w = WeekTwo()
        let cpdomains = ["9001 discuss.leetcode.com"]
        let list = w.subdomainVisits(cpdomains)
        print("list: \(list)")
    }
    
    
    func findShortestSubArray() {
        let w = WeekTwo()
//        let nums = [1,2,2,3,1]
        let nums = [1,2,2,3,1,4,2]
        let list = w.findShortestSubArray(nums)
        print("list: \(list)")
    }
   
    func maxSubArray()  {
        let n = MaxSubArray()
        n.test()
    }
    
    
    func numMatrix()  {
        let n = NumMatrix([])
        n.test()
    }
    
    
    
    func groupAnagrams()  {
        let g = GroupAnagrams()
        g.test()
    }
    
    
    func mergeTwoLinkList() {
        let m = MergeTwoLinkList()
        m.test()
    }
    
    func mergeSortedArray() {
        let m = MergeSortedArray()
        m.test()
    }
    
    func revertLinkNode() {
        let r = RevertLinkNode()
        r.test()
    }
    
    func validParentheses() {
        let v = ValidParentheses()
        let res = v.isValid("()")
        print("validParentheses: \(res)")
    }
    
    func reverseKGroup() {
        let r = ReverseKGroup()
        r.test()
    }
    
    func myCircularDeque() {
        MyCircularDeque.test()
    }
    
    func minStack() {
        let m = MinStack()
        m.test()
    }
    
    func twoSum() {
        let m = TwoSum()
        m.test()
    }
    
    func lRUCache() {
        LRUCache.test()
    }
    
    
}

