###  合并两个有序数组-88

 https://leetcode-cn.com/problems/merge-sorted-array/

```swift
    /// 方法二：  优化判断方法， 本质上没区别
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nums1Index: Int =  m - 1
        var nums2Index: Int =  n - 1
        for var i in (0...m+n-1).reversed() {
            // 如果nums2先为空，剩下的num1就是有序
            if (nums2Index < 0) {
                break
            }
            // 如果nums1先为空， 继续把nums2的数据搬进去
            if (nums1Index < 0 || nums2Index >= 0 && (nums2[nums2Index] > nums1[nums1Index])) {
                nums1[i] = nums2[nums2Index]
                nums2Index -= 1
            } else {
                nums1[i] = nums1[nums1Index]
                nums1Index -= 1
            }
            i -= 1
        }
    }
    
```



### 反转链表-206

https://leetcode-cn.com/problems/reverse-linked-list/

```swift
    ///方法一：  反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newLinkList: ListNode?
        let head = head
        var h = head
        while h != nil {
            let currentNode = ListNode(val: h?.val ?? 0, next: nil)
            currentNode.next = newLinkList
            newLinkList = currentNode
            h = h?.next
        }
        return newLinkList
    }
    
```



### 环形链表-141

https://leetcode-cn.com/problems/linked-list-cycle/

```swift
    func hasCycle(_ head: ListNode?) -> Bool {
        guard var head = head else {
            return false
        }
        var fastHead = head.next?.next
        while head.next != nil {
            if (head.next == nil || fastHead == nil) {
                return false
            }
           
            if (isEqual(head, fastHead!)) {
                return true
            }
            
            head = head.next!
            fastHead = fastHead?.next?.next
        }
        return false
    }
    
    
    func isEqual(_ a: ListNode, _ b: ListNode) -> Bool {
        return Unmanaged.passUnretained(a).toOpaque() == Unmanaged.passUnretained(b).toOpaque()
    }
```



### 环形链表 II-142 (待优化)

https://leetcode-cn.com/problems/linked-list-cycle-ii/

```swift
// 方法一
func detectCycle(_ head: ListNode?) -> ListNode? {
    var numList: [UnsafeMutableRawPointer] = []
    var node = head
    while node != nil {
        if numList.contains(Unmanaged.passUnretained(node!).toOpaque()) {
            return node
        }
        numList.append(Unmanaged.passUnretained(node!).toOpaque())
        node = node?.next
    }
    return nil;
}

```



###  有效的括号-20

https://leetcode-cn.com/problems/valid-parentheses/

```swift
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        let leftArr: [String.Element] = ["(", "[", "{"];
        let rightArr: [String.Element] = [")", "]", "}"];
        let map: [String.Element: String.Element] = ["(": ")","[":"]","{":"}"]
        var stackArray: [String.Element] = []
        for item in s {
            if leftArr.contains(item) {
                stackArray.append(item)
            }
            if rightArr.contains(item) {
                guard let top = stackArray.last else { return false }
                if map[top] == item {
                    stackArray.removeLast()
                } else {
                    return false
                }
            }
        }
        return stackArray.isEmpty
    }
```



### K 个一组翻转链表-25

https://leetcode-cn.com/problems/reverse-nodes-in-k-group/

```swift
 /*  k = 3
     nil->1->2->3->4->5->nil
     3->2->1->nil
     4->5->nil
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return head;
        }
        var tailNode = head
        for _ in 0..<k {
            if tailNode == nil { // 不足k个不需要反转
                return head
            }
            tailNode = tailNode?.next
        }
        // 分组反转
        let newHead = reverse(head: head, k: k)
        // 头结点反转之后移动到末尾， 指向下一个反转链表的头部进行连接
        head?.next = reverseKGroup(tailNode, k)
        return newHead
    }
    
    // 反转链表
    func reverse(head: ListNode?, k: Int) -> ListNode? {
        var n = 0
        var preNode: ListNode? = nil
        var curNode = head
        var nextNode: ListNode? = nil
        while (n < k) {
            nextNode = curNode?.next
            curNode?.next = preNode
            preNode = curNode
            curNode = nextNode
            n += 1
        }
        return preNode
    }
```



### 最小栈-155
https://leetcode-cn.com/problems/min-stack/

```swift

class MinStack {
    
    var list: [Int] = []
    
    var minList : [Int] = []
    
    init() {}
    
    func push(_ val: Int) {
        list.append(val)
        minList.append(min(minList.last ?? val, val))
    }
    
    func pop() {
        if list.isEmpty {
            return
        }
        list.removeLast()
        minList.removeLast()
    }
    
    func top() -> Int {
        return list.last ?? -1000000000000000000
    }
    
    func getMin() -> Int {
        return minList.last ?? -1000000000000000000
    }
    
    
    func test() {
        let minStack =  MinStack();
        print("minStack: \(minStack.push(-2))")
        print("minStack: \(minStack.push(0))")
        print("minStack: \(minStack.push(-3))")
        print("minStack: \(minStack.getMin())")
        print("minStack: \(minStack.pop())")
        print("minStack: \(minStack.top())")
        print("minStack: \(minStack.getMin())")
    }
    
}

```



### 两数之和

https://leetcode-cn.com/problems/two-sum/description/

```swift

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 数字： 下标
        var map: [Int: Int] = [:]
        var index = 0
        for item in nums {
            if (map[target - item] != nil) {
                return [map[target - item]!, index]
            } else {
                map[item] = index
            }
            index += 1
        }
        return []
    }
    
```



### 字母异位词分组-49

https://leetcode-cn.com/problems/group-anagrams/

```swift
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
```



### LRU缓存机制-146

https://leetcode-cn.com/problems/lru-cache/

```swift

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
    
   
}
```





### 二维区域和检索 - 矩阵不可变-304 (待优化)

https://leetcode-cn.com/problems/range-sum-query-2d-immutable/

```swift
class NumMatrix {
    
    var matrix: [[Int]] = []
    
    // 存储每行的前缀和
    var sumMatrix: [[Int]] = []

    init(_ matrix: [[Int]]) {
        self.matrix = matrix
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = 0
        // 累加每行数组的剩余面积
        for r in row1...row2 {
            // 如果col1为0， 着前一行的前缀和为0
            sum += sumRow(r, col2) - (col1 == 0 ? 0 : sumRow(r, col1 - 1))
        }
        return sum
    }
    
    // 第row1行col1的前缀和
    func sumRow(_ row1: Int, _ col1: Int) -> Int {
        var rowSum =  0
        for var j in 0...col1 {
            rowSum += matrix[row1][j]
            j += 1
        }
        return rowSum
    }
}

```



### 最大子序和-53

https://leetcode-cn.com/problems/maximum-subarray/

```swift
class MaxSubArray {
   
    var sumArray: [Int] = [0]
    
    var minStack: [Int] = [0]
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums.first!
        }
        var sum = 0
        var minSum = 0
        for i in 0..<nums.count {
            // 求前缀和数组
            sum += nums[i]
            sumArray.append(sum)
            // 求前缀和大
            minSum = min(minSum, sum)
            minStack.append(minSum)
        }
        
        var maxSum = sumArray[1]
        for i in 1..<sumArray.count {
            maxSum = max(maxSum, sumArray[i] - minStack[i-1])
        }
        return maxSum
    }
  
}
```



### 三数之和-15

https://leetcode-cn.com/problems/3sum/

```swift

        func threeSum(_ nums: [Int]) -> [[Int]] {
            // 不足三个数
            if nums.count < 3 {
                return []
            }
            let sortedArray = nums.sorted()
            print("sortedArray: \(sortedArray)")
            // 最小值大于0或者最大值小于0
            if sortedArray.first! > 0 || sortedArray.last! < 0 {
                return []
            }
            var ans: [[Int]] = []
    
            for  i in 0..<sortedArray.count {
                if i > 0 && sortedArray[i] == sortedArray[i-1] {
                    continue
                }
                var leftIndex = i + 1
                var rightIndex = sortedArray.count - 1
                while leftIndex < rightIndex {
                    let sum = sortedArray[i] + sortedArray[leftIndex] + sortedArray[rightIndex]
                    if (sum > 0){
                        rightIndex -= 1
                    } else if (sum < 0) {
                        leftIndex += 1
                    } else {
                        ans.append([sortedArray[leftIndex], sortedArray[i], sortedArray[rightIndex]])
                        while leftIndex < rightIndex && sortedArray[leftIndex] == sortedArray[leftIndex+1] {
                            leftIndex += 1
                        }
                        while rightIndex > leftIndex && sortedArray[rightIndex] == sortedArray[rightIndex-1] {
                            rightIndex -= 1
                        }
                        leftIndex += 1
                        rightIndex -= 1
                    }
                }
    
            }
    
            return ans
         }
```





### 盛最多水的容器-11

https://leetcode-cn.com/problems/container-with-most-water/

```swift
   func maxArea(_ height: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = height.count - 1
        var maxArea = 0
        while leftIndex < rightIndex {
            let width = rightIndex - leftIndex
            let h = min(height[rightIndex], height[leftIndex])
            maxArea = max(maxArea, width * h)
            if (height[leftIndex] > height[rightIndex]) {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }
        return maxArea
    }
    
```



### 子集-78

https://leetcode-cn.com/problems/subsets/

```swift

class Subsets {
    
    var ans: [[Int]] = []
    
    var choseArray: [Int] = [ ]
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        chooseNum(nums, 0)
        return ans
    }
    
    func chooseNum(_ nums: [Int], _ n: Int) {
        // 终结条件
        if n == nums.count {
            ans.append(choseArray)
            return
        }
        
        // 不选
        chooseNum(nums, n + 1)
        // 选
        choseArray.append(nums[n])
        chooseNum(nums, n + 1)
        
        // 还原当前层数据
        choseArray.removeLast()
    }
    
   
}
```





### 组合-77

https://leetcode-cn.com/problems/combinations/

```swift

class Combine {
    
    var ans: [[Int]] = [ ]
    
    var chosen: [Int] = [ ]
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
       choseNumber(n, k)
        return ans
    }
    
    
    private func choseNumber(_ n: Int, _ k: Int)  {
        // 剪枝 终止条件
        if n == -1 || chosen.count + n < k || chosen.count > k {
            return
        }
        // 终止条件
        if chosen.count == k {
            ans.append(chosen)
            return
        }
        // 不选
        choseNumber(n - 1, k)
        // 选
        chosen.append(n)
        choseNumber(n - 1, k)
        // 清理当前层
        chosen.removeLast()
    }
    
}

```



### 验证二叉搜索树-98

https://leetcode-cn.com/problems/validate-binary-search-tree/

```swift
class ValidBST {
    
    class TreeNode {
        
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    var pre = Int.min
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        guard let node = root else {
            return true
        }

        // 访问左子树
        if !isValidBST(node.left) {
            return false
        }
        // 访问当前节点：如果当前节点小于等于中序遍历的前一个节点，说明不满足BST，返回 false；否则继续遍历
        if node.val <= pre {
            return false
        }
        pre = node.val
        
        // 访问右子树
        return isValidBST(node.right)
    }
}

```



### 50. Pow(x, n)

https://leetcode-cn.com/problems/powx-n/

```swift
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        } else if n < 0 {
            return  myPow(1.0 / x, -n)
        }
        let isOdd = n % 2 == 0 ? 1 : x
        return myPow(x, n / 2) * myPow(x, n / 2) * isOdd
    }
```

