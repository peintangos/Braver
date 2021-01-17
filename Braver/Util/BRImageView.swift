//
//  BRImageView.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRImageView: UIImageView {
    init(name:String,frame:CGRect = CGRect(x: 0, y: 0, width: 140, height: 140)) {
        super.init(frame: frame)
        self.image = UIImage(named: name)
        self.contentMode = ContentMode.scaleAspectFill
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
