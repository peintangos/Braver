//
//  BRScrollView.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import UIKit

class BRScrollView: UIScrollView {
    init(frame:CGRect,contentSize:CGSize) {
        super.init(frame: frame)
        self.contentSize = contentSize
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
