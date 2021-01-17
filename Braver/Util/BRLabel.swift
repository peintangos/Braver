//
//  BRLabel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRLabel: UILabel {
    
    init(text:String,size:CGFloat,color:Color,width:CGFloat = 50,height:CGFloat = 50) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        self.createLabel(text: text, size: size, color: color)
    }
    
    func createLabel(text:String,size:CGFloat,color:Color){
        self.text = text
        self.font = UIFont.init(name: "Arial-BoldMT", size: size)
        self.textColor = color.getColor()
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
