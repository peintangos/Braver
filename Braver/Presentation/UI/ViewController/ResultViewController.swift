//
//  ResultViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
import UIKit
import YogaKit
import RxCocoa
import RxSwift

class ResultViewController :BaseViewController{
    
//    UIを宣言
    var contentView:UIScrollView!
    var resultTitle:BRLabel!
    var rankingLabel:BRLabel!
    var rankingTableView:BRView!
    var barLabel:BRLabel!
    var barTableView:BRView!
    var backButton:BRButton!
    var alert:UIAlertController!
    
//     変数を宣言
    var resultList:Array<Player>!
//        Fixedは既に決定している高さ
    let contentHeightFixed:Int = 780
//        UnFixedはまだ決定していない高さ
    var contentHeightUnFixed:Int{
        return 60 * (resultList.count + 1)
    }
    
    let dispose = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        doLayout()
        doRouter()
    }
    init(modalPresentationStyle:UIModalPresentationStyle, resultList:Array<Player>) {
        super.init()
        self.modalPresentationStyle = modalPresentationStyle
        self.resultList = resultList
    }
    override func viewDidAppear(_ animated: Bool) {
        doAnimation()
        doContentReSize()
        if DoRankService().isKingsMode(list: self.resultList) {
//           ここの領域外タップで、閉じる動作だがここではなくBRAlertController()の中で処理を行いたいが、うまくできない。
            alert = UIAlertController(title: NSLocalizedString("kingOkan", comment: ""), message: "おめでとうございます。\n「\(self.resultList[0].name)」さんが王様となりました。\n好きな命令をしてください👑", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction.init(title: NSLocalizedString("seeResult", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func doContentReSize(){
        self.contentView.contentSize.height = CGFloat(contentHeightFixed + contentHeightUnFixed)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func doLayout(){
//        let contentView = BRView(backgroundColor: .yellow)
        contentView = UIScrollView()
//        ContentSizeは意図的に設定する必要がある。（セーフエリアなどもろもろ計算する）
        contentView.contentSize = CGSize(width:self.view.frame.width, height:780)
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(self.view.frame.width)
            layout.height = YGValue(self.view.frame.height)
            layout.flexDirection = .column
        }
        resultTitle = BRLabel(text: NSLocalizedString("result", comment: ""), textSize: 60, textColor: .yellow,backGroundColor: .blue)
        resultTitle.configureLayout { [self] (layout) in
            layout.isEnabled = true
            layout.width = YGValue(self.view.frame.width)
            layout.height = YGValue(120)
            layout.position = .absolute
//            aboluteをつけると、Yogaのレイアウトを無視できることがわかった。
            layout.marginTop = YGValue(32 + global.safeAreaTop! + 120)
//            layout.marginTop = YGValue(global.safeAreaTop! + 264 + CGFloat(contentHeightUnFixed) + 416)
        }
        resultTitle.center = contentView.center
        rankingLabel = BRLabel(text:NSLocalizedString("ranking", comment: ""), textSize: 24, textColor: .yellow,alpha: 0, backGroundColor: .white)
        rankingLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(48)
            layout.width = YGValue(self.view.frame.width)
//            layout.marginTop = YGValue(216)
            layout.marginBottom = YGValue(32)
//           .absoluteを2つ以上つけると狂う
//            layout.position = .absolute
//            そして、一つ上の項目で.absolteを使用するとスペースを認識しなくなるので、絶対値の高さが必要になる。
            layout.marginTop = YGValue(184 + global.safeAreaTop!)
        }
        
        rankingTableView = BRView(backgroundColor: .white,alpha: 0)
        rankingTableView.configureLayout { [self] (layout) in
            layout.isEnabled = true
            layout.height = YGValue(integerLiteral: 60 * (resultList.count + 1))
            layout.width = YGValue(self.view.frame.width)
//            layout.position = .absolute
        }
        let rankingHeaderView = RankingCell.createRankingCell(view: self.view, upperLeftViewLeftLabel: NSLocalizedString("order", comment: ""), upperLeftViewRightLabel: NSLocalizedString("name", comment: ""), upperRightViewRighLabel: NSLocalizedString("diffMidle", comment: ""), bottomLeftViewRihtLabel: NSLocalizedString("selectNumber", comment: ""), bottomRightViewLeftLabel: NSLocalizedString("cover", comment: ""), bottomRightViewRightLabel: NSLocalizedString("middle", comment: ""))
        rankingTableView.addSubview(rankingHeaderView)
        resultList.forEach { eachResult in
            let rankingCell = RankingCell.createRankingCell(view: self.view, upperLeftViewLeftLabel: "\(eachResult.result.order!)位", upperLeftViewRightLabel: eachResult.name, upperRightViewRighLabel: String(eachResult.result.absoluteValue), bottomLeftViewRihtLabel: String(eachResult.result.selectedNumber!), bottomRightViewLeftLabel: eachResult.result.isOverLappedDisplay, bottomRightViewRightLabel: String(eachResult.result.isMiddleDisplay))
            rankingTableView.addSubview(rankingCell)
        }
        barLabel = BRLabel(text: NSLocalizedString("bar", comment: ""), textSize: 24, textColor: .yellow,alpha: 0,backGroundColor: .white)
        barLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(48)
            layout.width = YGValue(self.view.frame.width)
            layout.marginTop = 32
            layout.marginBottom = 32
//            layout.position = .absolute
        }
        barTableView = RankingNumberLine(backgroundColor: .blue,maxValue: global.numberList[2], alpha: 0,list:self.resultList)
        barTableView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(200)
            layout.width = YGValue(self.view.frame.width)
            layout.marginBottom = YGValue(32)
        }
        backButton = BRButton(backgroundColor: .yellow, textColor: .blue, text: NSLocalizedString("back", comment: ""), textSize: 60, alpha: 0)
        backButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(120)
            layout.width = YGValue(self.view.frame.width)
//            layout.position = .absolute
        }
        view.addSubview(contentView)
        contentView.addSubview(resultTitle)
        contentView.addSubview(rankingLabel)
        contentView.addSubview(rankingTableView)
        contentView.addSubview(barLabel)
        contentView.addSubview(barTableView)
        contentView.addSubview(backButton)
        contentView.yoga.applyLayout(preservingOrigin: true)
    }
    
    func doAnimation(){
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.init()) { [self] in
            let move = 120
//            let moveResult = 264 + CGFloat(contentHeightUnFixed) + 416 - 32
            resultTitle.center.y -= CGFloat(move)
            resultTitle.alpha = 1
        } completion: { _ in
            self.resultTitle.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 1, options: UIView.AnimationOptions.init()) {
            self.rankingLabel.alpha = 1
        } completion: { _ in
            self.rankingLabel.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1, options: UIView.AnimationOptions.init()) {
            self.rankingTableView.alpha = 1
        } completion: { _ in
            self.rankingTableView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1, options: UIView.AnimationOptions.init()) {
            self.barLabel.alpha = 1
        } completion: { _ in
            self.barLabel.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1, options: UIView.AnimationOptions.init()) {
            self.barTableView.alpha = 1
        } completion: { _ in
            self.barTableView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 1, options: UIView.AnimationOptions.init()) {
            self.backButton.alpha = 1
        } completion: { _ in
            self.backButton.alpha = 1
        }
    }
    func doRouter(){
        self.backButton.addTarget(self, action: #selector(goBack), for: UIControl.Event.touchUpInside)
    }
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func closeAlert(){
        alert.dismiss(animated: true, completion: nil)
        alert = nil
    }
}
