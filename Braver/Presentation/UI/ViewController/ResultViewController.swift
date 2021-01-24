//
//  ResultViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
import UIKit
import YogaKit

class ResultViewController :BaseViewController{
    
//    UIを宣言
    var resultTitle:BRLabel!
    var rankingLabel:BRLabel!
    var rankingTableView:BRView!
    var barLabel:BRLabel!
    var barTableView:BRView!
    var backButton:BRButton!
    
//     変数を宣言
    var list:Array = Array(repeating: 100, count: 4)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        doLayout()
    }
    init(modalPresentationStyle:UIModalPresentationStyle) {
        super.init()
        self.modalPresentationStyle = modalPresentationStyle
    }
    override func viewDidAppear(_ animated: Bool) {
        doAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func doLayout(){
//        let contentView = BRView(backgroundColor: .yellow)
        let contentView = UIScrollView()
//        ContentSizeは意図的に設定する必要がある。（セーフエリアなどもろもろ計算する）
        contentView.contentSize = CGSize(width:self.view.frame.width, height:2000)
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
//            layout.overflow = .scroll
            layout.width = YGValue(self.view.frame.width)
            layout.height = YGValue(self.view.frame.height)
            layout.flexDirection = .column
//            layout.justifyContent = .center
        }
        resultTitle = BRLabel(text: "RESULT", textSize: 60, textColor: .yellow,backGroundColor: .blue)
        resultTitle.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(self.view.frame.width)
            layout.height = YGValue(120)
            layout.position = .absolute
//            aboluteをつけると、Yogaのレイアウトを無視できることがわかった。
            layout.marginTop = 184
        }
        resultTitle.center = contentView.center
        rankingLabel = BRLabel(text:"Ranking", textSize: 24, textColor: .yellow,alpha: 0, backGroundColor: .white)
        rankingLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(48)
            layout.width = YGValue(self.view.frame.width)
            layout.marginTop = YGValue(216)
            layout.marginBottom = YGValue(32)
        }
        
        rankingTableView = BRView(backgroundColor: .white,alpha: 0)
        rankingTableView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(300)
            layout.width = YGValue(self.view.frame.width)
        }
        let rankingHeaderView = RankingCell.createRankingCell(view: self.view, upperLeftViewLeftLabel: "順位", upperLeftViewRightLabel: "名前", upperRightViewRighLabel: "スコア", bottomLeftViewRihtLabel: "選択した数字", bottomRightViewLeftLabel: "被り", bottomRightViewRightLabel: "真ん中")
        rankingTableView.addSubview(rankingHeaderView)
        list.forEach { index in
            let rankingCell = RankingCell.createRankingCell(view: self.view, upperLeftViewLeftLabel: "1位", upperLeftViewRightLabel: "松尾", upperRightViewRighLabel: "3", bottomLeftViewRihtLabel: "e", bottomRightViewLeftLabel: "e", bottomRightViewRightLabel: "d")
            rankingTableView.addSubview(rankingCell)
        }
        barLabel = BRLabel(text: "Bar", textSize: 24, textColor: .yellow,alpha: 0)
        barLabel.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(60)
            layout.width = YGValue(self.view.frame.width)
        }
        barTableView = BRView(backgroundColor: .blue,alpha: 0)
        barTableView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(120)
            layout.width = YGValue(self.view.frame.width)
            layout.marginBottom = YGValue(32)
        }
        backButton = BRButton(backgroundColor: .white, textColor: .blue, text: "BACK", textSize: 60, alpha: 0)
        backButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(120)
            layout.width = YGValue(self.view.frame.width)
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
        UIView.animate(withDuration: 3, delay: 0, options: UIView.AnimationOptions.init()) { [self] in
            let move = 122
            resultTitle.center.y -= CGFloat(move)
            resultTitle.alpha = 1
        } completion: { _ in
            self.resultTitle.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.init()) {
            self.rankingLabel.alpha = 1
        } completion: { _ in
            self.rankingLabel.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.init()) {
            self.rankingTableView.alpha = 1
        } completion: { _ in
            self.rankingTableView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.init()) {
            self.barLabel.alpha = 1
        } completion: { _ in
            self.barLabel.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.init()) {
            self.barTableView.alpha = 1
        } completion: { _ in
            self.barTableView.alpha = 1
        }
        UIView.animate(withDuration: 1, delay: 2, options: UIView.AnimationOptions.init()) {
            self.backButton.alpha = 1
        } completion: { _ in
            self.backButton.alpha = 1
        }
        

    }
}
