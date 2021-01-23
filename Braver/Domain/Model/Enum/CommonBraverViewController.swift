//
//  CommonBraverViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

/**
 Braverで使用する画面のスーパークラスです。
 */
import Foundation
import UIKit
import YogaKit
import RxSwift
import RxCocoa

class CommonBraverViewController :BaseNavigationViewController{
    var totalPlayerNumber:Int!
    var selfNumber:Int!
    var name:String!
    var startButton:UIButton!
    var inputNumber:BRLabel!
    var input:NumberInputSlider!
    var isTapped:Bool?
    private let sliderInputViewModel = NumberInputSliderViewModel()
    let dispose = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        doLayout()
        doBind()
    }
    
    init(totalPlayerNumber:Int!,selfNumber:Int,name:String = "Player",modalType:UIModalPresentationStyle = .fullScreen){
        super.init()
        self.totalPlayerNumber = totalPlayerNumber
        self.selfNumber = selfNumber
        self.name = name
        if name == "Player" {
            self.name = name + String(selfNumber)
        }
        self.modalPresentationStyle = modalType
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func doLayout(){
        let contetView = BRView(backgroundColor: .yellow)
        contetView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(global.baseView!.frame.width)
            layout.height = YGValue(global.baseView!.frame.height)
            layout.flexDirection = .column
        }
        let titleLabel = BRLabel(text: name, textSize: 60, color: .yellow, width: global.baseView!.frame.width, height: 333, alpha: 1,backGroundColor: .blue,yose:NSTextAlignment.center)
        titleLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = YGValue(32 + global.safeAreaTop!)
            layout.alignSelf = .center
            layout.width = YGValue(global.baseView!.frame.width)
            layout.height = YGValue(120)
        }
//        TODO なんでも良いが、textに値を入れないとYogaがスペースを認識せずに、潰れてしまう。
        inputNumber = BRLabel(text: "8", textSize: 108, color: .white, width: 0, height: 0, alpha: 1, backGroundColor: .yellow, yose: NSTextAlignment.center)
        inputNumber = BRLabel(text: "8", textSize: 108, color: .white, alpha: 1, backGroundColor: .yellow, yose: .center)
        inputNumber.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = 32
            layout.marginBottom = 32
        }
        input = NumberInputSlider(backgroundColor:Color.blue)
        input.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = 32
            layout.marginBottom = 32
            layout.width = YGValue((global.baseView?.frame.width)! - 64)
            layout.height = YGValue(84)
            layout.alignSelf = .center
        }
        startButton = BRButton(backgroundColor: .yellow, textColor: .white, text: "STRAT", textSize: 60, alpha: 1.0)
        startButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = 32
            layout.width = YGValue(210)
            layout.height = YGValue(72)
//            最近気づいたことだが、configureLayoutの中でwidthとheightを意図的に設定してあげないとflex-directionとか効かない。
            layout.flexDirection = .column
            layout.alignSelf = .center
        }
        
        contetView.addSubview(titleLabel)
        contetView.addSubview(inputNumber)
        contetView.addSubview(input)
        contetView.addSubview(startButton)
        view.addSubview(contetView)
        contetView.yoga.applyLayout(preservingOrigin: true)
        
    }
    func doBind(){
        input
            .rx
            .value
            .map{ Int($0)}.bind(to: sliderInputViewModel.valueBehaviorSubject)
            .disposed(by: dispose)

        sliderInputViewModel.valueBehaviorSubject
            .map { String($0) }
            .bind(to: inputNumber.rx.text)
        
    }
}
