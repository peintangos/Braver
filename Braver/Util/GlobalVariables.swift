//
//  GlobalValiables.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import Foundation
import UIKit

class GlobalValiables {
//    デバイスのUIViewを持っていいます
    var baseView:UIView?
//    セーフエリアを取得します
    var safeArea :UIEdgeInsets?
    var safeAreaTop:CGFloat?
    var safeAreaBottom:CGFloat?
    let splashTilteHeight = 160
//    UINavigationController
    var globalNavigationController:UINavigationController!
//    MySLiderBarに値を設定する際に、型がFloatであるため。
    let maxValueGlobal:Float = 8.0
//    中間の点
    var middleValueGlobal:Int {
        Int(maxValueGlobal / 2)
    }
//    ゲームに必要な変数を宣言します。
    var totalPlayerNumber:Int!
//    プレイヤーのリストを宣言します（配列そのものは初期化は人数を選択した時に行います。）
    var players:Array<Player>!
//    TODO ↑本当はライフサイクルと合わせたほうが良い。例えば、ゲーム毎に意味のある数字なのでゲームで一位になるようにしたほうが良い。
    var numberList:Array<Int> = []
    //    TODO ↑本当はライフサイクルと合わせたほうが良い。例えば、ゲーム毎に意味のある数字なのでゲームで一位になるようにしたほうが良い。
}
