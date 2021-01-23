//
//  PlayerNumber.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import Foundation

enum PlayerNumber {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case tweleve
    func getNumger() -> Int{
        switch self {
        case .one:
        return 1
        case .two:
        return 2
        case .three:
        return 3
        case .four:
        return 4
        case .five:
        return 5
        case .six:
        return 6
        case .seven:
        return 7
        case .eight:
        return 8
        case .nine:
        return 9
        case .ten:
        return 10
        case .eleven:
        return 11
        case .tweleve:
        return 12
        }
    }
    func getString() -> String{
        switch self {
        case .one:
        return "1"
        case .two:
        return "2"
        case .three:
        return "3"
        case .four:
        return "4"
        case .five:
        return "5"
        case .six:
        return "6"
        case .seven:
        return "7"
        case .eight:
        return "8"
        case .nine:
        return "9"
        case .ten:
        return "10"
        case .eleven:
        return "11"
        case .tweleve:
        return "12"
        }
    }
    func getStringWithUnit() -> String{
        switch self {
        case .one:
        return "1人"
        case .two:
        return "2人"
        case .three:
        return "3人"
        case .four:
        return "4人"
        case .five:
        return "5人"
        case .six:
        return "6人"
        case .seven:
        return "7人"
        case .eight:
        return "8人"
        case .nine:
        return "9人"
        case .ten:
        return "10人"
        case .eleven:
        return "11人"
        case .tweleve:
        return "12人"
        }
    }

}
