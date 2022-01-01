//
//  ViewController.swift
//  JKHomeWork
//
//  Created by GZ05008ML on 2021/12/30.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        mergeSortedArray()
//
//        revertLinkNode()
        
//        validParentheses()
        
//        reverseKGroup()
        
        mergeTwoLinkList()
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

}

