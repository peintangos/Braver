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
        let titleView = BRLabel(text: "Braverへ\nようこそ", textSize: 48, textColor: Color.white,backGroundColor: .yellow)
        titleView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = 200
            layout.marginTop = YGValue(44)
        }
        let explanationView = BRLabel(text: "Braverは真ん中に近い数字を選んだ人が勝ちの単純な暇つぶしゲームです。ルールは簡単。以下の2つです。", textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose:.left)
        explanationView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.paddingTop = 20
            layout.marginRight = 20
            layout.marginLeft = 20
            layout.marginTop = 20
        }
        let explanationView1Header = BRLabel(text: "ルール", textSize: 36, textColor: Color.white,backGroundColor: .yellow,yose: .left)
        explanationView1Header.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginLeft = 20
            layout.marginTop = 20
        }
        let explanationView1 = BRLabel(text: " \n・真ん中からの差で順位が決まります。\n・他の人と被ってしまった場合、被った数字同士では真ん中の数字から遠い人が強くなります。", textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
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
        
        let explanationView2 = BRLabel(text: "例えば、真ん中の数字が「4」でプレイヤーが選んだ数字が「0,0,1,2,3,3,5,6」だとします。まず被っていないプレイヤー同士でランキング化されるので、「5」を選んだプレイヤーが1位、「2」と「6」を選んだプレイヤーが同率で2位、1を選んだプレイヤーが4位となります。次に、被ってしまったプレイヤー同士でランキング化されます。4から遠いほど強いので、0を選んだプレイヤーが同率で5位、3を選んだプレイヤーが同率で7位となります。", textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
        explanationView2.configureLayout { (layout) in
            layout.isEnabled = true
            layout.paddingTop = 20
            layout.marginRight = 20
            layout.marginLeft = 20
            layout.marginTop = 20

        }
        let explanationView3 = BRLabel(text: " もし真ん中の数字を選び、他の誰とも被らなかった場合、特別な演出を用意してあります。是非、真ん中を狙ってみてください。", textSize: 16, textColor: Color.white,backGroundColor: .yellow,yose: .left)
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
