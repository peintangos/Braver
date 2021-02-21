//
//  RankingCell.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/24.
//

import Foundation
import YogaKit

class RankingCell:BRView{
    static func createRankingCell(view:UIView,
                                  upperLeftViewLeftLabel:String,
                                  upperLeftViewRightLabel:String,
                                  upperRightViewRighLabel:String,
                                  bottomLeftViewRihtLabel:String,
                                  bottomRightViewLeftLabel:String,
                                  bottomRightViewRightLabel:String) -> BRView{
        let rankingHeaderView = BRView(backgroundColor: .white)
        rankingHeaderView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = 60
            layout.width = YGValue(view.frame.width)
            layout.flexDirection = .column
        }
        let rankingUppderHeaderView = BRView(backgroundColor: .blue)
        rankingUppderHeaderView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width)
            layout.height = 30
            layout.flexDirection = .row
        }
        let rankingUpperHeaderViewLeft = BRView(backgroundColor: .blue)
        rankingUpperHeaderViewLeft.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 2)
            layout.height = 30
            layout.flexDirection = .row
        }
        let rankingLeftUpperHeaderViewLeft = BRLabel(text: upperLeftViewLeftLabel, textSize: 16, textColor: .yellow,backGroundColor: .white, yose: .left)
        rankingLeftUpperHeaderViewLeft.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 4)
        }
        rankingUpperHeaderViewLeft.addSubview(rankingLeftUpperHeaderViewLeft)
        let rankingRightUpperHeaderViewLeft = BRLabel(text: upperLeftViewRightLabel, textSize: 16, textColor: .yellow,backGroundColor: .white, yose: .left)
        rankingRightUpperHeaderViewLeft.adjustsFontSizeToFitWidth = true
        rankingRightUpperHeaderViewLeft.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 4)
        }
        rankingUpperHeaderViewLeft.addSubview(rankingRightUpperHeaderViewLeft)

        rankingUppderHeaderView.addSubview(rankingUpperHeaderViewLeft)
        let rankingUpperHeaderViewRight = BRView(backgroundColor: .white)
        rankingUpperHeaderViewRight.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 2)
            layout.height = 30
        }
        let rankingLeftUpperHeaderViewRight = BRLabel(text: upperRightViewRighLabel, textSize: 16, textColor: .yellow,backGroundColor:.white,yose: .left)
        rankingLeftUpperHeaderViewRight.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 2)
            layout.height = 30
        }
        rankingUpperHeaderViewRight.addSubview(rankingLeftUpperHeaderViewRight)
        rankingUppderHeaderView.addSubview(rankingUpperHeaderViewRight)
        rankingHeaderView.addSubview(rankingUppderHeaderView)

        let rankingBottomHeaderView = BRView(backgroundColor: .yellow)
        rankingBottomHeaderView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width)
            layout.height = 30
            layout.flexDirection = .row
        }
        let rankingBottomHeaderViewLeft = BRView(backgroundColor: .white)
        rankingBottomHeaderViewLeft.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 2)
            layout.height = 30
        }
        rankingBottomHeaderView.addSubview(rankingBottomHeaderViewLeft)

        let rankingLeftBottomHeaderViewLeft = BRLabel(text: bottomLeftViewRihtLabel, textSize: 16, textColor: .yellow,backGroundColor: .white)
        rankingLeftBottomHeaderViewLeft.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginLeft = 16
            layout.width = 96
            layout.height = 30
        }
        rankingBottomHeaderViewLeft.addSubview(rankingLeftBottomHeaderViewLeft)

        let rankingBottomHeaderViewRight = BRView(backgroundColor: .white)
        rankingBottomHeaderViewRight.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(view.frame.width / 2)
            layout.height = 30
            layout.flexDirection = .row
        }
        rankingBottomHeaderView.addSubview(rankingBottomHeaderViewRight)

        let rankingLeftBottomHeaderViewRight = BRLabel(text: bottomRightViewLeftLabel, textSize: 16, textColor: .yellow,backGroundColor: .white, yose: .left)
        rankingLeftBottomHeaderViewRight.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
            layout.width = YGValue(view.frame.width / 4)
        }
        rankingBottomHeaderViewRight.addSubview(rankingLeftBottomHeaderViewRight)

        let rankingRightBottomHeaderViewRight = BRLabel(text: bottomRightViewRightLabel, textSize: 16, textColor: .yellow,backGroundColor: .white,yose: .left)
        rankingRightBottomHeaderViewRight.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexGrow = 1
            layout.width = YGValue(view.frame.width / 4)
        }
        rankingBottomHeaderViewRight.addSubview(rankingRightBottomHeaderViewRight)

        rankingHeaderView.addSubview(rankingBottomHeaderView)
        return rankingHeaderView
    }
}


