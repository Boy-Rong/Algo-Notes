//
//  ViewController.swift
//  AlgoNotes
//
//  Created by 荣恒 on 2022/1/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("<-----------------------test----------------------->")
        testDemo()
//        testLeetcode()
//        testLeetcodeString()
//        testLeetcodeLinked()
//        testLeedcode1()
//        testLeetcodeTree()
//        testLeetcodeDP()
//        testLeetcodeMath()
        testLeetcodeList()
        debugPrint("<-----------------------****----------------------->")
    }
    
    func testDemo() {
        /*
         [0,25063,5,25062,7,25061,9,25060,11,25059,13,25058,15,
          25057,17,25056,19,25055,21,25054,23],
         [5,4,3,2,1]
         */
//        let list = MergeSort(sortList: [
//            0,25063,5,25062,7,25061,9,25060,11,25059,13,25058,15,
//            25057,17,25056,19,25055,21,25054,23
//        ])
//            .sort()
//        debugPrint(list)
    }
    
    func testLeetcode() {
        var list = [[1,2,3],[4,5,6],[7,8,9]]
        rotate(&list)
        debugPrint(list)
    }
    
    func testLeetcodeString() {
//        let value = isPalindrome("0P")
//        let value = myAtoi("42")
        let value = longestCommonPrefix("flower", "flow")
        debugPrint(value)
    }

    func testLeetcodeLinked() {
//        let node5 = ListNode(val: 5)
//        let node4 = ListNode(val: 4, next: node5)
//        let node3 = ListNode(val: 3, next: node4)
//        let node2 = ListNode(val: 2, next: node3)
//        let head = ListNode(val: 1, next: node2)
        
        let node2 = ListNode(val: 2, next: nil)
        let head = ListNode(val: 1, next: nil)
        
        let value = isPalindrome(head)
        debugPrint(value)
    }
    
    func testLeetcodeTree() {
        let node4 = TreeNode.init(val: 4)
        let node5 = TreeNode.init(val: 5)
        let node6 = TreeNode.init(val: 5)
        let node7 = TreeNode.init(val: 4)
        
        let node2 = TreeNode.init(val: 3, left: node4, right: nil)
        let node3 = TreeNode.init(val: 3, left: node6, right: node7)
        let root = TreeNode.init(val: 2, left: node2, right: node3)
        
        let value = isSymmetric(root)
        debugPrint(value)
    }
    
    func testLeedcode1() {
        let value = commonPrefix(["google", "gucci 官网", "g18", "g小调进行曲", "great", "girl", "go", "g2", "gai", "go的过去式英文", "google play下载", "go on", "got", "google翻译", "go out", "god", "goal", "good night", "good morning", "good luck!什么意思", "goodafternoon怎么读英语", "百度", "国家"], prefix: "good")
        debugPrint(value)
    }
    
    func testLeetcodeDP() {
//        let value = climbStairs(3)
        let value = maxProfit([7,1,5,3,6,4])
        debugPrint(value)
    }
    
    func testLeetcodeMath() {
        let value = fizzBuzz(15)
        debugPrint(value)
    }
    
    func testLeetcodeList() {
//        var list = [3,4,5,1,2]
//        let root = NTreeNode.init(1001, children: [
//            NTreeNode.init(100101, children: [
//                NTreeNode.init(10010101, children: []),
//                NTreeNode.init(10010102, children: []),
//                NTreeNode.init(10010103, children: [])
//            ]),
//            NTreeNode.init(100102, children: [
//                NTreeNode.init(10010201, children: []),
//                NTreeNode.init(10010202, children: []),
//                NTreeNode.init(10010203, children: [])
//            ]),
//            NTreeNode.init(100103, children: [
//                NTreeNode.init(10010301, children: []),
//                NTreeNode.init(10010302, children: []),
//                NTreeNode.init(10010303, children: [])
//            ])
//        ])

//        let string = "the sky     is blue"
//        let value = pivotIndex(list)
//        let value = findDiagonalOrder(list)
//        let value = longestPalindrome(string)
//        let value = reverseWords(string)
//        let value = arrayPairSum(list)
//        let value = twoSum2(list, -1)
//        let value = minSubArrayLen(7, list)
//        let value = reverseWords("Let's take LeetCode contest")
//        let value = findMin(list)
//        let value = search(root: root, targetId: 1001)
//        let node3 = ListNode.init(val: 4)
//        let node2 = ListNode.init(val: 0, next: node3)
//        let node1 = ListNode.init(val: 2, next: node2)
//        node3.next = node1
//        let head = ListNode.init(val: 3, next: node1)
//        let value = detectCycle(head)
        
//        let head1 = ListNode.init(val: 9, next: .init(val: 9, next: .init(val: 9, next: .init(val: 9, next: .init(val: 9, next: .init(val: 9, next: .init(val: 9)))))))
//        let head2 = ListNode.init(val: 9, next: .init(val: 9, next: .init(val: 9, next: .init(val: 9))))
//        let value = addTwoNumbers(head1, head2)
        
//        let head = ListNode.init(val: 1, next: .init(val: 2, next: .init(val: 3, next: .init(val: 4, next: .init(val: 5)))))
//        let head = ListNode.init(val: 3, next: .init(val: 3, next: .init(val: 3)))
//        head.next?.next?.next = head
//        let value = rotateRight(head, 1)
//        let value = removeElements(head, 6)
//        let value = isPalindrome1(head)
//        let value = sortList(head)
//        let value = insert(head, 0)
//        debugPrint(value)
        
//        let node9 = TreeNode.init(val: 9)
//        let node15 = TreeNode.init(val: 15)
//        let node7 = TreeNode.init(val: 7)
//        let node20 = TreeNode.init(val: 20, left: node15, right: node7)
//        let root = TreeNode.init(val: 3, left: node9, right: node20)
//        let value = levelOrder(root)
        
//        let value = longestCommonSubsequence("abcde", "ace")
//        debugPrint(value)
        
//        let value = longestConsecutive([1,2,0,1])
//        let value = findKthLargest([3,3,3,3,3,3,3,3,3], 1)
//        debugPrint(value)
        
//        let head = ListNode.init(val: 1, next: .init(val: 4, next: .init(val: 3, next: .init(val: 2, next: .init(val: 5, next: .init(val: 2))))))
//        let value = listNode(head, 3)
//        let value = lengthOfLongestSubstring("abba")
//        let value = reverseParentheses("(abcd)")
//        let value = letterCombinations("23")
        let value = threeSum([-1,0,1,2,-1,-4])
        debugPrint(value)
    }
}

