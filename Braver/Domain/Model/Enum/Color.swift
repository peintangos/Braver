//
//  Color.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import Foundation
import UIKit

enum Color {
    case yellow
    case blue
    case white
    func getColor() -> UIColor{
        var color:UIColor!
        switch self {
        case .yellow:
            color = UIColor(red: 223 / 255, green: 168 / 255, blue: 73 / 255, alpha: 1)
        case .blue:
            color = UIColor(red: 45 / 255, green: 90 / 255, blue: 181 / 255, alpha: 1)
        case .white:
            color = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        }
        return color
    }
}
