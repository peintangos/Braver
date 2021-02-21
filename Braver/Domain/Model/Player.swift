//
//  PlayerModel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation

class Player  {
    var name:String{
        var userName = "PLAYER\(self.order!)"
        if global.defaults.bool(forKey: "isNameSaved") {
            let key = "nameNumber" + "_" + String(global.totalPlayerNumber!) + "_" + "nameOrder" + "_" + String(self.order)
            userName = global.defaults.string(forKey: key)!
        }
        return userName
    }
    var score:Int!
    var order:Int!
    var selectedNumber:Int!
    var result:Result!
    var absoluteValue:Int {
        abs(selectedNumber - global.numberList[1])
    }
//    TODO どうすれば良いのかわからないが、scoreとselectedNumberは初期化時点では決まらないので、initには含めない。
    init(name:String = "デフォルト",order:Int) {
//        self.name = name
        self.order = order
    }
}
