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
        testLeetcodeString()
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

}

