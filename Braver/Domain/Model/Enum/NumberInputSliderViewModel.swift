//
//  NumberInputSliderViewModel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class NumberInputSliderViewModel {
    let valueBehaviorSubject = BehaviorSubject<Int>(value: (global.maxValue + 1 ) / 2)
}
