//
//  CommonBraverViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
import YogaKit
import UIKit
import RxCocoa
import RxSwift

class CommonBraverViewController :BaseViewController{
    //    変数を用意
    var selfNumber:Int!
    var isTapped:Bool?
    var memoriList:Array<Int> = [0,4,8]
    var selectedNumber:Int!
    
    var player:Player!
        
    //    UIをコントローラに宣言しておく
    var inputNumber:BRLabel!
    var input:NumberInputSlider!
    var startButton:UIButton!
    var memoriView:UIView!

    private let sliderInputViewModel = NumberInputSliderViewModel()
    let dispose = DisposeBag()
    
    private let service = DoRankService()
    override func viewDidLoad() {
        super.viewDidLoad()
        doLayout()
        doBind()
        doRouter()
        doInitialize()
    }
        
    init(selfNumber:Int,player:Player){
        super.init()
        self.selfNumber = selfNumber
        self.player = player
        }

        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func doInitialize(){
        self.navigationItem.hidesBackButton = true
    }
        func doLayout(){
            let contetView = BRView(backgroundColor: .yellow)
            contetView.configureLayout { (layout) in
                layout.isEnabled = true
                layout.width = YGValue(global.baseView!.frame.width)
                layout.height = YGValue(global.baseView!.frame.height)
                layout.flexDirection = .column
            }
            let titleLabel = BRLabel(text: "PLAYER\(selfNumber!)", textSize: 60, textColor: .yellow, width: global.baseView!.frame.width, height: 333, alpha: 1,backGroundColor: .blue,yose:NSTextAlignment.center)
            titleLabel.configureLayout { (layout) in
                layout.isEnabled = true
                layout.marginTop = YGValue(32 + global.safeAreaTop!)
                layout.alignSelf = .center
                layout.width = YGValue(global.baseView!.frame.width)
                layout.height = YGValue(120)
            }
    //        TODO textの値はなんでも良いが、textに値を入れないとYogaがスペースを認識せずに、潰れてしまう。
            inputNumber = BRLabel(text: "8", textSize: 108, textColor: .white, width: 0, height: 0, alpha: 1, backGroundColor: .yellow, yose: NSTextAlignment.center)
            inputNumber = BRLabel(text: "8", textSize: 108, textColor: .white, alpha: 1, backGroundColor: .yellow, yose: .center)
            inputNumber.configureLayout { (layout) in
                layout.isEnabled = true
                layout.marginTop = 32
                layout.marginBottom = 32
            }
            input = NumberInputSlider(backgroundColor:Color.blue)
            input.configureLayout { (layout) in
                layout.isEnabled = true
                layout.marginTop = 32
                layout.marginBottom = 16
                layout.width = YGValue((global.baseView?.frame.width)! - 64)
                layout.height = YGValue(84)
                layout.alignSelf = .center
            }
        memoriView = BRView(backgroundColor: .yellow)
            memoriView.configureLayout { (layout) in
                layout.isEnabled = true
                layout.width = YGValue(global.baseView!.frame.width - 64)
                layout.height = YGValue(60)
                layout.marginLeft = YGValue(32)
                layout.marginRight = YGValue(32)
                layout.flexDirection = .row
                layout.justifyContent = .spaceBetween
            }
            global.numberList.forEach { (number) in
                let number = BRLabel(text: String(number), textSize: 48, textColor: .white)
                number.configureLayout { (layout) in
                    layout.isEnabled = true
                    layout.width = YGValue(64)
                    layout.height = YGValue(64)
                }
                memoriView.addSubview(number)
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
            contetView.addSubview(memoriView)
            contetView.addSubview(startButton)
            view.addSubview(contetView)
            contetView.yoga.applyLayout(preservingOrigin: true)
            
        }
        
        func doBind(){
            input
                .rx
                .value
                .map{ Int($0)}
                .bind(to: sliderInputViewModel.valueBehaviorSubject).disposed(by: dispose)

            sliderInputViewModel.valueBehaviorSubject
                .map { String($0) }
                .bind(to: inputNumber.rx.text).disposed(by: dispose)
            
            self.input.inputView?.rx
        }
        func doRouter(){
            self.startButton.addTarget(self, action: #selector(doMove), for: UIControl.Event.touchUpInside)
        }
        @objc func doMove(){
//            画面遷移する際に、最終的に選択したスコアを格納する(Plyaerのscore要素だけは決まっていないことに注意)
            service.setSelctedNumber(index: self.selfNumber - 1, selectedNumber: Int(input.value))
            
            if self.selfNumber < global.totalPlayerNumber {
                let nextNumber = selfNumber + 1
                Router.movePageByPush(from: self, to: CommonBraverViewController(selfNumber: nextNumber,player: global.players[nextNumber - 2]))
            }else {
                service.doRank()
                self.dismiss(animated: true, completion: nil)
                Router.movePageByModal(from: self.presentingViewController!, to: ResultViewController(modalPresentationStyle: .fullScreen,resultList: service.doRank()))
            }
        }
}
