//
//  NumberInputSlider.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import UIKit

class NumberInputSlider: UISlider {
    init(backgroundColor:Color) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = backgroundColor.getColor()
        self.tintColor = .white
        self.minimumValue = 0
        self.maximumValue = 200
//        奇数を想定している
        self.value = (maximumValue + 1) / 2
    }
    
//    SliderBarは、本来つまみだけしか弄れないようなAPIになっていたので、Overrideしました。
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
//    触れる位置をy軸方向に広げました。
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var wideBounds = bounds
        wideBounds.size.height += 32 // boundsを20.0px分下に拡張
        return wideBounds.contains(point) // pointがwideBounds内にあるかどうか
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
