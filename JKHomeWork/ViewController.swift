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
        
        mergeSortedArray()
    
        revertLinkNode()
    }

    
    func mergeSortedArray() {
        let m = MergeSortedArray()
        m.test()
    }
    
    func revertLinkNode() {
        let r = RevertLinkNode()
        r.test()
    }

}

