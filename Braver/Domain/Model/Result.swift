//
//  Result.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
struct Result{
    var index:Int
    var selectedNumber:Int
    var absoluteValue:Int {
        return abs(selectedNumber - global.middleValueGlobal)
    }
    var isOverLapeed:Bool?
}
