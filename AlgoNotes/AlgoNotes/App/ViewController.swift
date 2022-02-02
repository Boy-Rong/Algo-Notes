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
        testLeetcode()
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
        var nums1 = [2,0]
        let nums2 = [1]
        merge(&nums1, 1, nums2, 1)
        debugPrint(nums1)
    }

}

