//
//  BRButton.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRButton: UIButton {
    func createButton(backgroundColor:Color,textColor:Color,text:String,textSize :CGFloat = 64,alpha:CGFloat){
        self.backgroundColor = backgroundColor.getColor()
        self.setTitle(text, for: UIControl.State.normal)
        self.setTitleColor(textColor.getColor(), for: UIControl.State.normal)
        self.titleLabel?.font = UIFont.init(name: "Arial-BoldMT", size: textSize)
        self.alpha = alpha
    }
    init(backgroundColor:Color = .yellow,textColor:Color = .blue,text:String = "",textSize :CGFloat = 64,alpha:CGFloat = 1) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.createButton(backgroundColor: backgroundColor, textColor: textColor, text: text,alpha:alpha)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setShadow(){
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
        self.layer.cornerRadius = 5
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension BRButton {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var rect = bounds
        rect.origin.x -= 20
        rect.origin.y -= 20
        rect.size.width += 40
        rect.size.height += 40

        // 拡大したViewサイズがタップ領域に含まれているかどうかを返します
        return rect.contains(point)
    }
}
