//
//  BRButton.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRButton: UIButton {
    func createButton(backgroundColor:Color,textColor:Color,text:String,textSize :CGFloat = 64,frame:CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)){
        self.backgroundColor = backgroundColor.getColor()
        self.titleLabel?.textColor = textColor.getColor()
        self.titleLabel?.text = text
        self.titleLabel?.font = UIFont.init(name: "Arial-BoldMT", size: textSize)
        self.frame = frame
    }
    init(backgroundColor:Color,textColor:Color,text:String,textSize :CGFloat = 64,frame:CGRect) {
        super.init(frame: frame)
        self.createButton(backgroundColor: backgroundColor, textColor: textColor, text: text,frame: frame)
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
