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
        global.isBraver ? abs(selectedNumber! - global.numberList[1]) : abs(selectedNumber! - global.numberList[2])
        
    }
    var isMiddleDisplay:String{
        if global.isBraver {
            return global.numberList[1] == selectedNumber!  ? "○" : "×"
        }else {
            return global.numberList[2] == selectedNumber!  ? "○" : "×"
        }
    }
    var isOverLappedDisplay:String{
        return self.isOverLapeed! ? "○" : "×"
    }
    var isOverLapeed:Bool?
}

