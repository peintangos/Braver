//
//  BRView.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRView: UIView {
    init(backgroundColor:Color,frame:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0),alpha:CGFloat = 1.0) {
        super.init(frame: frame)
        createView(backgroundColor: backgroundColor,alpha:alpha)
    }
    func createView(backgroundColor:Color,alpha:CGFloat){
        self.backgroundColor = backgroundColor.getColor()
        self.alpha = alpha
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
