//: [Previous](@previous)

import Foundation


// https://leetcode-cn.com/problems/plus-one/solution/liang-ci-dao-xu-zhong-jian-bian-li-chu-l-k79p/
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
var res = plusOne([7,8,9]);
print(res)

var res1 = plusOne([9,9,9]);
print(res1)

var res2 = plusOne([9,8,7]);
print(res2)





class ListNode {
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

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var l1 = list1
    var l2 = list2
    print("mergeTwoLists: \(l1!.val) -- \(l2!.val)")
    // 把list2合并到list1上去
    while l1 != nil {
        print("mergeTwoLists: 11")
        while l2 != nil {
            if (l2!.val >= l1!.val) {
                print(l2!.val)
                let orginall2Next = l2?.next;
                l2?.next = l1?.next
                l1?.next = l2
                l1 = l2
                l2 = orginall2Next
                print("mergeTwoLists: 22")
            } else {
                print("mergeTwoLists: 33")
                break
            }
        }
        if (l2 == nil) {
            print("mergeTwoLists: 44")
            break
        }
        print("mergeTwoLists: 55")
        l1 = l1!.next
    }
    
    return l1
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
    let a = [1,2,4]
    let b = [1,3,4]
    let list1 = creatNodeListWithArray(a).next
    let list2 = creatNodeListWithArray(b).next
    let l = mergeTwoLists(list1, list2)
//    printAllNode(l: list1)
//    printAllNode(l: list2)
    printAllNode(l: l)
    
}

test()
