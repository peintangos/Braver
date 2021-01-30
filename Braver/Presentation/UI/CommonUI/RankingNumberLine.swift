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
    var maxValue:Int!
    var minValue:Int!
    var middleValue:Int!
    var list:Array<Player>!
    init(backgroundColor:Color,minValue:Int = 0,maxValue:Int,alpha:CGFloat,list:Array<Player>) {
        super.init(backgroundColor:backgroundColor,alpha: alpha)
        self.minValue = minValue
        self.maxValue = maxValue
        self.middleValue = maxValue / 2
        self.list = list
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
//        左側部分です
        let leftTopX = rect.minX
        let leftTopY = rect.minY
        let leftBottomX = rect.minX
        let leftBottomY = rect.maxY
//       　少し余白を開けるために、実際はこちらを使う
        let realLeftTopX =  rect.minX + 10
        let realLeftCenterX = rect.minX  + 10
        let realLeftBottomX = rect.minX  + 10
//        右側部分です
        let rightTopX = rect.maxX
        let rightTopY = rect.minY
        let rightBottomX = rect.maxX
        let rightBottomY = rect.maxY
//        少し余白を開けるために、実際はこちらを使う
        let realRightTopX =  rect.maxX - 10
        let realRightCenterX = rect.maxX  - 10
        let realRightBottomX = rect.maxX  - 10
//        真ん中部分です
        let centerTopX = rect.midX
        let centerTopY = rect.minY
//        縦の長さを4分割した位置を定義します。
        let centerQuarterTopX = rect.midX
        let centerQuaterTopY = rect.maxY / 4
//        縦の長さを6分割した場合の位置を定義します。
        let centerSixUpperTopY = rect.maxY / 6
        let centerSixUpperBottomTopY = (rect.maxY / 6) * 2
        let centerSixBottomTopY = (rect.maxY / 6 ) * 4
        let centerSixBottomBottomY = (rect.maxY / 6) * 5
//        縦の長さを8分割した位置を定義します。
        let centerEightUpperFirstY = rect.maxY / 8
        let centerEightUpperSecondY = (rect.maxY / 8) * 2
        let centerEightUpperThirdY = (rect.maxY / 8) * 3
        let centerEightBottomFirstY = (rect.maxY / 8 ) * 5
        let centerEightBottomSecondY = (rect.maxY / 8) * 6
        let centerEightBottomThidY = (rect.maxY / 8) * 7
//        微調整に使う(1/16)
        let centerSixteenUpperFirstY = (rect.maxY / 16 ) * 9
        let centerX = rect.midX
        let centerY = rect.midY
        let centerQuarterBottomX = rect.midX
        let centerQuaterBottomY = (rect.maxY / 4 ) * 3
        let centerBottomX = rect.midX
        let centerBottomY = rect.maxY
        
//        数直線を描きます。
        path.move(to: CGPoint(x: leftTopX, y: rect.midY))
        path.addLine(to: CGPoint(x: rightTopX, y: rect.midY))
        path.close()
        
//        真ん中の縦線を描きます。
        path.move(to: CGPoint(x: centerQuarterTopX, y: centerQuaterTopY))
        path.addLines(to: [CGPoint(x: centerQuarterBottomX, y: centerQuaterBottomY)])
        path.close()
        
//        左側の最小ラベルを作成します。
        var numberLabelMin = BRLabel(text: String(minValue), textSize: 24, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
        numberLabelMin.frame = CGRect(x: Int(realLeftCenterX), y: Int(centerSixteenUpperFirstY), width: 24, height: 24)
        numberLabelMin.center.x = CGFloat(realLeftCenterX)
        self.addSubview(numberLabelMin)
    
//        右側の最大ラベルと作成します。
        var numberLabelMax = BRLabel(text: String(maxValue), textSize: 24, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
        numberLabelMax.frame = CGRect(x: Int(realRightCenterX), y: Int(centerSixteenUpperFirstY), width: 24, height: 24)
        numberLabelMax.center.x = CGFloat(realRightCenterX)
        self.addSubview(numberLabelMax)

//        ここのスコアを数直線上に描画していきます。
        var inTurns:Bool = true
        let dictionary = Dictionary.init(grouping: list) { (p) -> Int in
            return p.selectedNumber!
        }
        dictionary.sorted { $0.key < $1.0}.forEach {
                var playerSelectedNumberLabel = (Int(rect.maxX) / maxValue) * $0.value[0].selectedNumber!
                var startPoint = CGPoint()
//                数直線を左右10ptずつ離れたた所に設定しているため、値を少し修正
                if playerSelectedNumberLabel == minValue {
                    playerSelectedNumberLabel = Int(realLeftCenterX)
                }
                if playerSelectedNumberLabel == maxValue {
                    playerSelectedNumberLabel = Int(realRightCenterX)
                }
    //            Yogaを使うと少しめんどくさそうなので、地道にframeを突っ込んだ。
//            数字のラベルを作ります。ただし、minとmaxは大きさを変えているのでそこだけ上書きしないようにする
            var playersName = ""
            if $0.value[0].selectedNumber! != minValue && $0.value[0].selectedNumber! != maxValue {
                var numberLabel = BRLabel(text: String($0.value[0].selectedNumber!), textSize: 16, textColor: .white, width: 16, height: 16, alpha: 1, backGroundColor: .blue, yose: .center)
                numberLabel.frame = CGRect(x: playerSelectedNumberLabel, y: Int(centerSixteenUpperFirstY), width: 16, height: 24)
                numberLabel.center.x = CGFloat(playerSelectedNumberLabel)
                self.addSubview(numberLabel)
                
                for (index, player) in zip($0.value.indices, $0.value) {
                    playersName += "\(player.name!)"
                    if index != $0.value.count - 1 {
                        playersName += "\n"
                    }
                }
            }
            let popTip = PopTip()
            popTip.cornerRadius = 0
            popTip.textColor = Color.yellow.getColor()
            popTip.tintColor = Color.white.getColor()
            popTip.bubbleColor = Color.white.getColor()
//            真ん中より大きいかどうかで三角形の位置を決めます。
            if $0.value[0].selectedNumber! < middleValue {
                popTip.arrowOffset = 15
            }else if $0.value[0].selectedNumber! > middleValue {
                popTip.bubbleOffset = -30
                popTip.arrowOffset = -15
            }else {
//                真ん中の想定
                popTip.arrowOffset = 15
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
