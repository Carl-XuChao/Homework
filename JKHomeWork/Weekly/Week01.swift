//
//  FirstWeekly.swift
//  HomeWork
//
//  Created by Carl Xu on 2021/12/28.
//

import Foundation


/* 66. 加一
 https://leetcode-cn.com/problems/plus-one/
 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 */
class PlusOne {
   
    func plusOne(_ digits: [Int]) -> [Int] {
        var resArr: [Int] = []
        // 倒序
        let list = digits.reversed()
        
        // 条件： digits[i] + 1 > 9 进一位， 并且当前值=0
        var index = 0
        for item in list {
            if (item + 1 < 10) {
                resArr.append(item + 1)
                break
            } else {
                resArr.append(0)
                index += 1
            }
        }
      
        // 补全剩下数据
        for (i, item) in list.enumerated() {
            if (i > index) {
                resArr.append(item)
            }
        }
        
        // 超过最高位数，进一位
        if index > list.count - 1 {
            resArr.append(1)
        }

        // 数组再倒叙
        return resArr.reversed()
    }

    // test case
    func test() {
        let res = plusOne([7,8,9]);
        print(res)

        let res1 = plusOne([9,9,9]);
        print(res1)

        let res2 = plusOne([9,8,7]);
        print(res2)
    }

}



/*  21. 合并两个有序链表
 https://leetcode-cn.com/problems/merge-two-sorted-lists/
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 */
class MergeTwoLinkList {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var curNodeOne = list1
        var curNodeTwo = list2
        if (list1 == nil) {
            return list2
        }
        if (list2 == nil) {
            return list1
        }
        let head: ListNode? = ListNode()
        head?.next = list1
        var preNodeOne : ListNode? = nil
        // 把list2合并到list1上去
        while curNodeOne != nil {
            while curNodeTwo != nil {
                let curNodeTwoNext = curNodeTwo?.next
                if (curNodeTwo!.val <= curNodeOne!.val) {
                    // list2当前结点数据比list当前结点数据大时，将list2当前结点数据插入到list当前结点之前
                    if preNodeOne == nil {
                        // 没有前驱结点情况，插入作为头结点
                        preNodeOne = curNodeTwo
                        head?.next = preNodeOne
                    }
                    preNodeOne?.next = curNodeTwo
                    curNodeTwo?.next = curNodeOne
                    preNodeOne = curNodeTwo
                    curNodeTwo = curNodeTwoNext
                } else {
                    // 移动list1， 如果list1全部移动完， 则把list2的全部元素移进list1
                    let curNodeOneNext = curNodeOne?.next
                    if curNodeOneNext == nil {
                        curNodeOne?.next = curNodeTwo
                        return head?.next
                    } else {
                        preNodeOne = curNodeOne
                        curNodeOne = curNodeOneNext
                    }
                }
            }
            curNodeOne = curNodeOne!.next
        }
        
        return head?.next
    }
    
    func creatNodeListWithArray(_ list: [Int]) -> ListNode {
        let head = ListNode()
        var lastNode = head
        for item in list {
            let l = ListNode.init(val: item, next: nil)
            lastNode.next =  l
            lastNode = l
        }
        return head
    }

    func printAllNode(l: ListNode?) {
        var nodel = l
        while nodel != nil {
            print("printAllNode:  \(nodel!.val)")
            nodel = nodel!.next
        }
    }
     
    func test() {
//        let a = [1,2,4]
//        let b = [1,3,4]
//        let a: [Int] = []
//        let b = [0]
//        let a = [2]
//        let b = [1]
        let a = [-9, 3]
        let b = [5, 7]
        let list1 = creatNodeListWithArray(a).next
        let list2 = creatNodeListWithArray(b).next
        let l = mergeTwoLists(list1, list2)
    //    printAllNode(l: list1)
    //    printAllNode(l: list2)
        printAllNode(l: l)
    }
    
}




/* 641. 设计循环双端队列
 https://leetcode-cn.com/problems/design-circular-deque/
 设计实现双端队列。
 你的实现需要支持以下操作：
 MyCircularDeque(k)：构造函数,双端队列的大小为k。
 insertFront()：将一个元素添加到双端队列头部。 如果操作成功返回 true。
 insertLast()：将一个元素添加到双端队列尾部。如果操作成功返回 true。
 deleteFront()：从双端队列头部删除一个元素。 如果操作成功返回 true。
 deleteLast()：从双端队列尾部删除一个元素。如果操作成功返回 true。
 getFront()：从双端队列头部获得一个元素。如果双端队列为空，返回 -1。
 getRear()：获得双端队列的最后一个元素。 如果双端队列为空，返回 -1。
 isEmpty()：检查双端队列是否为空。
 isFull()：检查双端队列是否满了。

 */

class MyCircularDeque {
    
    var capacity = 0
    
    var list: [Int] = []
    

    init(_ k: Int) {
        capacity = k
    }
    
    func insertFront(_ value: Int) -> Bool {
        if list.count == capacity {
            return false
        }
        list.insert(value, at: 0)
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if list.count == capacity {
            return false
        }
        list.append(value)
        return true
    }
    
    
    func deleteFront() -> Bool {
        if list.isEmpty {
            return false
        }
        list.remove(at: 0)
        return true
    }
    
    func deleteLast() -> Bool {
        if list.isEmpty {
            return false
        }
        list.removeLast()
        return true
    }
    
    func getFront() -> Int {
        if list.isEmpty {
            return -1
        }
        return list.first!
    }
    
    func getRear() -> Int {
        if list.isEmpty {
            return -1
        }
        return list.last!
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    func isFull() -> Bool {
        return list.count == capacity
    }
    
    static func test()  {
        let circularDeque =  MyCircularDeque.init(3) // 设置容量大小为3
        print("\(circularDeque.insertLast(1))")
        print("\(circularDeque.insertLast(2))")
        print("\(circularDeque.insertFront(3))")
        print("\(circularDeque.insertFront(4))")
        print("\(circularDeque.getRear())")
        print("\(circularDeque.isFull())")
        print("\(circularDeque.deleteLast())")
        print("\(circularDeque.insertFront(4))")
        print("\(circularDeque.getFront())")
    }
}




