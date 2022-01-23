//
///*
// * @lc app=leetcode.cn id=23 lang=swift
// *
// * [23] 合并K个升序链表
// */
//
//// @lc code=start
//
//
////public class ListNode {
////   public var val: Int
////
////   public var next: ListNode?
////
////   public init() {
////      self.val = 0;
////      self.next = nil;
////   }
////
////   public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
////}
//
//
//struct Node {
//
//    var key: Int;
//
//    var listNode: ListNode?
//
//    init(_  key: Int, _ listNode: ListNode?) {
//        self.key = key
//        self.listNode = listNode
//    }
//}
//
//// 用数组来实现对堆: 根结点比子结点都大或者都小
//class BinaryHeap {
//    var heap: [Node] = []
//
//     init() {
//        heap.append(Node(0, nil))
//    }
//
//    func empty() -> Bool {
//        return heap.count == 1
//    }
//
//    func getMin() -> Node {
//        return heap[1]
//    }
//
//
//    func insert(_ node: Node) {
//        heap.append(node)
//        // 插入到数组末尾， 再向上冒泡比较与父结点的大小， 进行位置交换。
//        heapIfyUp(heap.count - 1)
//    }
//
//    private func heapIfyUp(_ p: Int) {
//        var cur = p
//        while cur > 1 {
//            if heap[p].key < heap[cur/2].key {
//                let tmp = heap[cur]
//                heap[cur] = heap[cur/2]
//                heap[cur/2] = tmp
//                cur /= 2
//            } else {
//                break
//            }
//        }
//    }
//
//    func deleteMin() {
//        if heap.count > 1 {
//            // 对头与对尾数据交换， 删除对尾元素
//            heap[1] = heap[heap.count - 1]
//            heap.removeLast()
//            heapIfyDown(1)
//        }
//    }
//
//    private func heapIfyDown(_ p: Int) {
//        var cur = p
//        // 要换的孩子下表标记
//        var child = cur * 2
//        while child < heap.count {
//            let other = cur * 2 + 1
//            if other < heap.count && heap[other].key < heap[child].key {
//                child = other
//            }
//            if heap[child].key < heap[p].key {
//                let tmp = heap[cur]
//                heap[cur] = heap[child]
//                heap[child] = tmp
//                cur = child
//                child = p * 2
//            } else {
//                break
//            }
//        }
//    }
//
//}
//
//
//
//class Solution1 {
//
//    var q = BinaryHeap()
//
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        for listNode in lists {
//            if listNode == nil {
//                continue
//            }
//            q.insert(Node(listNode?.val ?? -1, listNode))
//        }
//        let head: ListNode? = nil
//        var tail = head
//        while !q.empty() {
//            let node = q.getMin()
//            q.deleteMin()
//            // 链表
//            tail?.next = node.listNode
//            tail = tail?.next
//
//            let next = node.listNode?.next
//            if next != nil {
//                q.insert(Node(next?.val ?? -1, next))
//            }
//        }
//        return head?.next
//    }
//
//    static func test() {
//        let obj = Solution1()
//        let lists = [[1,4,5],[1,3,4],[2,6]]
//        let res = obj.mergeKLists(lists)
//        print("res:  \()")
//    }
//}
//// @lc code=end
//
//
//


/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 */


class PriorityQueue {

    // 关键🐎： 下标
    var heap: [[Int: Int]] = []

    init() {}

}

// @lc code=start
class Solution2 {

    var q = PriorityQueue()

    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = []
        for i in 0..<nums.count {
            q.heap.append([nums[i]: i])
            if i >= k - 1 {
                // [i - k + 1, i] 这段Max
                while q.heap.first!.values.first! <= i - k {
                    q.heap.removeFirst()
                    ans.append(q.heap.first!.keys.first!)
                }
            }
        }
        return ans
    }
}
// @lc code=end

