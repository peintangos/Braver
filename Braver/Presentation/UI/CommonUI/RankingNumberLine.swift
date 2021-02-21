//
//  RankingNumberLine.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/30.
//

import Foundation
import UIKit
import AMPopTip
class RankingNumberLine :BRView {
    var list:Array<Player>!
    init(backgroundColor:Color,minValue:Int = 0,maxValue:Int,alpha:CGFloat,list:Array<Player>) {
        super.init(backgroundColor:backgroundColor,alpha: alpha)
        self.list = list
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
//        左側部分です
        let leftTopX = rect.minX
        _ = rect.minY
        _ = rect.minX
        _ = rect.maxY
//       　少し余白を開けるために、実際はこちらを使う
        _ =  rect.minX + 10
        let realLeftCenterX = rect.minX  + 10
        _ = rect.minX  + 10
//        右側部分です
        let rightTopX = rect.maxX
        _ = rect.minY
        _ = rect.maxX
        _ = rect.maxY
//        少し余白を開けるために、実際はこちらを使う
//        二桁の時に見切れないようにするために、
        _ =  rect.maxX - 20
//        二桁の時に見切れないようにするために、
        let realRightCenterX = rect.maxX  - 20
        _ = rect.maxX  - 10
//        真ん中部分です
        _ = rect.midX
        _ = rect.minY
//        縦の長さを4分割した位置を定義します。
        _ = rect.midX
        _ = rect.maxY / 4
//        縦の長さを6分割した場合の位置を定義します。
        _ = rect.maxY / 6
        _ = (rect.maxY / 6) * 2
        _ = (rect.maxY / 6 ) * 4
        _ = (rect.maxY / 6) * 5
//        縦の長さを8分割した位置を定義します。
        _ = rect.maxY / 8
        _ = (rect.maxY / 8) * 2
        _ = (rect.maxY / 8) * 3
        _ = (rect.maxY / 8 ) * 5
        _ = (rect.maxY / 8) * 6
        _ = (rect.maxY / 8) * 7
//        微調整に使います(1/16)
        let centerSixteenUpperFirstY = (rect.maxY / 16 ) * 9
        let centerX = rect.midX
        let centerY = rect.midY
        _ = rect.midX
        _ = (rect.maxY / 4 ) * 3
        _ = rect.midX
        _ = rect.maxY
        
//        数直線を描きます。
        path.move(to: CGPoint(x: leftTopX, y: rect.midY))
        path.addLine(to: CGPoint(x: rightTopX, y: rect.midY))
        path.close()
        
//        真ん中の縦線を描きます。→少しずれるのでやめた。
//        path.move(to: CGPoint(x: centerX, y: centerEightUpperThirdY))
//        path.addLines(to: [CGPoint(x: centerX, y: centerEightBottomFirstY)])
//        path.close()
        
//        左側の最小ラベルを作成します。
        let numberLabelMin = BRLabel(text: String(global.numberList[0]), textSize: 24, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
        numberLabelMin.frame = CGRect(x: Int(realLeftCenterX), y: Int(centerSixteenUpperFirstY), width: 28, height: 24)
        numberLabelMin.center.x = CGFloat(realLeftCenterX)
        self.addSubview(numberLabelMin)
        
//        真ん中の最小ラベルを作成します。
        let numberLabelMiddle = BRLabel(text: String(global.numberList[1]), textSize: 24, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
        numberLabelMiddle.frame = CGRect(x: Int(centerX), y: Int(centerSixteenUpperFirstY), width: 24, height: 24)
        numberLabelMiddle.center.x = CGFloat(centerX)
        self.addSubview(numberLabelMiddle)
    
//        右側の最大ラベルと作成します。
        let numberLabelMax = BRLabel(text: String(global.numberList[2]), textSize: 24, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
        numberLabelMax.frame = CGRect(x: Int(realRightCenterX), y: Int(centerSixteenUpperFirstY), width: 28, height: 24)
        numberLabelMax.center.x = CGFloat(realRightCenterX)
        self.addSubview(numberLabelMax)

//        ここのスコアを数直線上に描画していきます。
        var inTurns:Bool = true
//        同じスコアごとにグループングし、スコア対プレイヤーが1対多になるようにします。
        let dictionary = Dictionary.init(grouping: list) { (p) -> Int in
            return p.selectedNumber!
        }
        dictionary.sorted { $0.key < $1.0}.forEach {
                var playerSelectedNumberLabel = (Int(rect.maxX) / global.numberList[2]) * $0.value[0].selectedNumber!
//                数直線を左右10ptずつ離れたた所に設定しているため、値を少し修正
                if playerSelectedNumberLabel == global.numberList[0] {
                    playerSelectedNumberLabel = Int(realLeftCenterX)
                }
                if playerSelectedNumberLabel == global.numberList[2] {
                    playerSelectedNumberLabel = Int(realRightCenterX)
                }
//            Yogaを使うと少しめんどくさそうなので、地道にframeを突っ込んだ。
//            数字のラベルを作ります。ただし、minとmaxとmiddleは大きさを変えているのでそこだけ上書きしないようにする
            if !($0.value[0].selectedNumber == global.numberList[0] || $0.value[0].selectedNumber == global.numberList[2] || $0.value[0].selectedNumber == global.numberList[1]) {
                let numberLabel = BRLabel(text: String($0.value[0].selectedNumber!), textSize: 16, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
                numberLabel.frame = CGRect(x: playerSelectedNumberLabel, y: Int(centerSixteenUpperFirstY), width: 16, height: 24)
                numberLabel.center.x = CGFloat(playerSelectedNumberLabel)
                self.addSubview(numberLabel)
            }
            var playersName = ""
            for (index, player) in zip($0.value.indices, $0.value) {
                playersName += "\(player.name)"
                if index != $0.value.count - 1 {
                    playersName += "\n"
                }
            }
            let popTip = PopTip()
            popTip.cornerRadius = 0
            popTip.textColor = Color.yellow.getColor()
            popTip.tintColor = Color.white.getColor()
            popTip.bubbleColor = Color.white.getColor()
            
//            真ん中より大きいかどうかで三角形の位置を決めます。
            if $0.value[0].selectedNumber! < global.numberList[1] {
                popTip.arrowOffset = 15
            }else if $0.value[0].selectedNumber! > global.numberList[1] {
                popTip.bubbleOffset = -30
                popTip.arrowOffset = -15
            }else {
//                真ん中の想定
                popTip.arrowOffset = 0
                popTip.bubbleOffset = -10
            }
//             近い距離だとかぶることがあるので、交互にします。
            if inTurns {
                popTip.show(text: playersName, direction: .up, maxWidth: 200, in: self, from: CGRect(x:playerSelectedNumberLabel, y: Int(centerY), width: 30, height: 32))
                inTurns = false
            }else {
                popTip.show(text: playersName, direction: .down, maxWidth: 200, in: self, from: CGRect(x:playerSelectedNumberLabel, y: Int(centerY), width: 30, height: 32))
                inTurns = true
            }
                popTip.shouldDismissOnTap = false
                popTip.shouldDismissOnTapOutside = false
                self.addSubview(popTip)
            }
            path.close()
            Color.white.getColor().setStroke()
            path.stroke()
            }
}


private extension UIBezierPath {
    func addLines(to positions: [CGPoint]) {
            positions.forEach { position in
                addLine(to: CGPoint(x: position.x, y: position.y))
            }
        }
}
