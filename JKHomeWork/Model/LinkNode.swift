//
//  LinkNode.swift
//  HomeWork
//
//  Created by GZ05008ML on 2021/12/29.
//

import Foundation

/// 链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}



public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}
