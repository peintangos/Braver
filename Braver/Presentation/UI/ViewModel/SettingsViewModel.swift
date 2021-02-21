//
//  SettingsViewModel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import Foundation
import RxSwift
import RxCocoa

class SettingsViewModel {
    let isNameSavedBehaviorSubject = BehaviorSubject(value: false)
    let isKingRuleBehaviorSubject = BehaviorSubject(value: true)
}
