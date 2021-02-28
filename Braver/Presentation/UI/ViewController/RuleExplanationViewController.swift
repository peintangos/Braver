//
//  SettingViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import UIKit
import YogaKit

class RuleExplanationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color.yellow.getColor()
        let contentView = BRScrollView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), contentSize:CGSize(width: (global.baseView?.frame.width)!, height: 800))
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue((global.baseView?.frame.width)!)
            layout.height = YGValue((global.baseView?.frame.height)!)
        }
        let titleView = BRLabel(text: global.isBraver ? NSLocalizedString("welcome", comment: "") : NSLocalizedString("welcomeBraver2", comment: ""), textSize: 48, textColor: Color.white,backGroundColor: .yellow)
        titleView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = 200
            layout.marginTop = YGValue(44)
        }
        let explanationView = BRLabel(text:global.isBraver ?  NSLocalizedString("welcome1", comment: "") : NSLocalizedString("welcome1Braver2", comment: ""), textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose:.left)
        explanationView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.paddingTop = 20
            layout.marginRight = 20
            layout.marginLeft = 20
            layout.marginTop = 20
        }
        let explanationView1Header = BRLabel(text: NSLocalizedString("rule", comment: ""), textSize: 36, textColor: Color.white,backGroundColor: .yellow,yose: .left)
        explanationView1Header.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginLeft = 20
            layout.marginTop = 20
        }
        let explanationView1 = BRLabel(text:global.isBraver ?  NSLocalizedString("welcome2", comment: "") : NSLocalizedString("welcome2Braver2", comment: ""), textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
        explanationView1.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginRight = 20
            layout.marginLeft = 20
        }
//        let attrText2 = NSMutableAttributedString(string: explanationView1.text!)
//        attrText2.addAttributes([
//                    .foregroundColor: Color.blue.getColor(),
//                    ], range: NSMakeRange(9, 1))
//        attrText2.addAttributes([
//            .foregroundColor: Color.blue.getColor(),
//            ], range: NSMakeRange(36, 20))
//        explanationView1.attributedText = attrText2
        
        let explanationView2 = BRLabel(text: global.isBraver ? NSLocalizedString("welcome3", comment: "") : NSLocalizedString("welcome3Braver2", comment: ""), textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
        explanationView2.configureLayout { (layout) in
            layout.isEnabled = true
            layout.paddingTop = 20
            layout.marginRight = 20
            layout.marginLeft = 20
            layout.marginTop = 20

        }
        let explanationView3 = BRLabel(text: global.isBraver ? NSLocalizedString("welcome4", comment: "") : NSLocalizedString("welcome4Braver2", comment: ""), textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
//        let attrText1 = NSMutableAttributedString(string: explanationView3.text!)
//        attrText1.addAttributes([
//                    .foregroundColor: Color.blue.getColor(),
//                    ], range: NSMakeRange(3, 21))
//        attrText1.addAttributes([
//            .foregroundColor: Color.blue.getColor(),
//            ], range: NSMakeRange(27, 8))

//        explanationView3.attributedText = attrText1
        explanationView3.configureLayout { (layout) in
            layout.isEnabled = true
            layout.paddingTop = 20
            layout.marginRight = 20
            layout.marginLeft = 20
            layout.marginTop = 20
        }
        contentView.addSubview(titleView)
        contentView.addSubview(explanationView)
        contentView.addSubview(explanationView1Header)
        contentView.addSubview(explanationView1)
        contentView.addSubview(explanationView2)
        contentView.addSubview(explanationView3)

        view.addSubview(contentView)
        contentView.yoga.applyLayout(preservingOrigin: true)

    }
    @objc func onClick(){
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
