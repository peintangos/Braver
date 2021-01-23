//
//  BRLabel.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit

class BRLabel: UILabel {
    
//    TODO BRLabelにwidth/heightを設定してもうまく反映されなかったので、Yogaのconfigurelayoutで意図的に設定した。
//    TODO NSTextAlignmetを設定しないと左寄せになってしまう。なお、子要素ではなくテキストが自分自身についているため、このように無理やり引数を指定するしかなかった。
//    TODO デフォルトで中央よせとする
    init(text:String,textSize:CGFloat,color:Color,width:CGFloat = 50,height:CGFloat = 50,alpha:CGFloat = 1.0,backGroundColor:Color! = .yellow,yose:NSTextAlignment = .center) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.createLabel(text: text, size: textSize, color: color, alpha: alpha, backGroundColor: backGroundColor,yose:yose)
    }
    
    func createLabel(text:String,size:CGFloat,color:Color,alpha:CGFloat,backGroundColor:Color,yose:NSTextAlignment){
        self.text = text
        self.font = UIFont.init(name: "Arial-BoldMT", size: size)
        self.textColor = color.getColor()
        self.alpha = alpha
        self.backgroundColor = backGroundColor.getColor()
        self.textAlignment = yose
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
