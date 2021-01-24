//
//  PlayerModel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation

class Player  {
    var name:String!
    var score:Int!
    var order:Int!
    var selectedNumber:Int!
//    TODO どうすれば良いのかわからないが、scoreとselectedNumberは初期化時点では決まらないので、initには含めない。
    init(name:String = "デフォルト",order:Int) {
        self.name = name
        self.order = order
    }
}