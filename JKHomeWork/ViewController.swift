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
        
        numMatrix()
        
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

