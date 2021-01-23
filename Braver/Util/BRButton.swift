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
    init(backgroundColor:Color,textColor:Color,text:String,textSize :CGFloat = 64,alpha:CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.createButton(backgroundColor: backgroundColor, textColor: textColor, text: text,alpha:alpha)
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
