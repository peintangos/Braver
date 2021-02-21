//
//  QuestionViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import UIKit
import YogaKit
import RxSwift
import RxCocoa

class QuestionViewController: UIViewController {
    let dispose = DisposeBag()
    var contentView:BRView!
    var ruleExplanation:BRView!
    var ruleButton:BRButton!
    var ruleExplanation1:BRView!
    var settingButton:BRButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//            テキストの設定の仕方だけ特殊
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor:Color.white.getColor()]
        self.navigationController!.navigationBar.barTintColor = Color.yellow.getColor()
        self.navigationController!.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "完了", style: UIBarButtonItem.Style.done, target: self, action: #selector(closeModal))
        self.navigationController!.navigationBar.tintColor = Color.blue.getColor()
//        横に3列の想定なので、マージン分を考慮（10*2*3）で、残りを3でわる
        let tileWidth = (global.baseView!.frame.width - 60) / 3
        let tileIconWidth = (global.baseView!.frame.width - 60) / 6
        contentView = BRView(backgroundColor: Color.yellow)
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(global.baseView!.frame.width)
            layout.height = YGValue(global.baseView!.frame.height)
            layout.display = .flex
            layout.flexDirection = .row
            layout.justifyContent = .flexStart
            layout.flexWrap = .wrap
            layout.marginTop = YGValue(44 + global.safeAreaTop!)
        }
        ruleExplanation = BRView(backgroundColor: .blue)
        ruleExplanation.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(tileWidth)
            layout.height = YGValue(tileWidth)
            layout.display = .flex
            layout.flexDirection = .column
            layout.padding = 10
            layout.margin = 10
            layout.justifyContent = .center
            layout.alignItems = .center
        }
        ruleButton = BRButton(backgroundColor:Color.blue)
        ruleButton.setImage(UIImage(named: "rule"), for: UIControl.State.normal)
        ruleButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(tileIconWidth)
            layout.height = YGValue(tileIconWidth)
        }
        let ruleLabel = BRLabel(text: "ルール説明", textSize: 12, textColor: Color.white,backGroundColor: .blue)
        ruleLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = 10
        }
        ruleExplanation.addSubview(ruleButton)
        ruleExplanation.addSubview(ruleLabel)
        
        contentView.addSubview(ruleExplanation)
        ruleExplanation1 = BRView(backgroundColor: .blue)
        ruleExplanation1.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(tileWidth)
            layout.height = YGValue(tileWidth)
            layout.display = .flex
            layout.flexDirection = .column
            layout.padding = 10
            layout.margin = 10
            layout.justifyContent = .center
            
            layout.alignItems = .center
        }
        
        settingButton = BRButton(backgroundColor:Color.blue)
        settingButton.setImage(UIImage(named: "settings"), for: UIControl.State.normal)
        settingButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(tileIconWidth)
            layout.height = YGValue(tileIconWidth)
        }
        let ruleLabel1 = BRLabel(text: "設定", textSize: 12, textColor: Color.white,backGroundColor: .blue)
        ruleLabel1.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = 10
        }
        ruleExplanation1.addSubview(settingButton)
        ruleExplanation1.addSubview(ruleLabel1)
        
        
        contentView.addSubview(ruleExplanation1)
        view.addSubview(contentView)
        contentView.yoga.applyLayout(preservingOrigin: true)
        
        self.doRouter()
    }
    @objc func onClick(){
        self.dismiss(animated: true, completion: nil)
    }
    func doRouter(){
        self.ruleButton.rx.tap.subscribe { (layout) in
            Router.movePageByPush(from: self, to:RuleExplanationViewController())
        }.disposed(by: dispose)
        self.settingButton.rx.tap.subscribe { (layout) in
            Router.movePageByPush(from: self, to: SettingsViewController())
        }.disposed(by: dispose)
    }
    
    @objc func closeModal(){
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
