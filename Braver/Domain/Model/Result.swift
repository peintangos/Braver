//
//  Result.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
class Result{
    init(index: Int, selectedNumber: Int,isOverLapeed:Bool) {
        self.index = index
        self.selectedNumber = selectedNumber
        self.isOverLapeed = isOverLapeed
    }
    var index:Int?
    var selectedNumber:Int?
    var order:Int?
    var absoluteValue:Int {
        return abs(selectedNumber! - global.numberList[1])
    }
    var isMiddleDisplay:String{
        return selectedNumber == global.numberList[1] ? "○" : "×"
    }
    var isOverLappedDisplay:String{
        return self.isOverLapeed! ? "○" : "×"
    }
    var isOverLapeed:Bool?
}

