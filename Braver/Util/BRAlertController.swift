//
//  BRAlertController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import UIKit

class BRAlertController {
    var alertController:UIAlertController!
    private var service:DoRankService!
    
    func of(title:String! = nil,titleTextColor:Color = .blue,message:String! = nil,preferredStyle:UIAlertController.Style = .actionSheet,textColor:Color = .blue,backGroundColor:Color = .blue,isDefaultBackButton:Bool = true,service:DoRankService!) -> BRAlertController{
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.view.tintColor = textColor.getColor()
        if isDefaultBackButton {
            alertController.addAction(UIAlertAction.init(title: NSLocalizedString("back2", comment: ""), style: UIAlertAction.Style.cancel, handler: { (UIAlertAction) in
            }))
        }
        let subview = (alertController
                    .view.subviews.first?.subviews.first?.subviews.first!)! as UIView
          subview.layer.cornerRadius = 1
        subview.backgroundColor = Color.yellow.getColor()
        
//        戻るボタンの背景色を変更
        alertController.itemBackgroundColor()
        
        self.service = service
        
        return self
    }
    
    func addAction(from:UIViewController,title:String = "",style:UIAlertAction.Style = .default) -> BRAlertController{
        self.alertController.addAction(UIAlertAction.init(title: title, style: UIAlertAction.Style.default, handler: { [self] (action) in
//            "~人"で登録しているため、最後の一文字を取り除いて、Intにする。（このやり方は本当に良くない）
            global.totalPlayerNumber = Int(title.dropLast())!
//            本当は、ここで毎回初期化するのはよくない。ライフサイクルと一致しているべきなのでゲームごとに設定したりするべき。
            global.players = Array<Player>()
            service.addPlayers()
            service.addZeroMediumLargeNumbers(maxValue: global.totalPlayerNumber)
            let rvc = CommonBraverViewController(selfNumber: 1, player: global.players[0])
            let vc = UINavigationController(rootViewController: rvc)
            vc.navigationBar.barTintColor = Color.yellow.getColor()
            vc.modalPresentationStyle = .fullScreen
            vc.navigationItem.hidesBackButton = true
            Router.movePageByModal(from: from, to: vc)
        }))
        return self
    }
    func createAlert() -> UIAlertController{
        return UIAlertController(title: NSLocalizedString("kingOkan", comment: ""), message: NSLocalizedString("conglats", comment: ""), preferredStyle: UIAlertController.Style.alert)
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



private extension UIAlertController {
    func itemBackgroundColor() {
        // ここでキャンセルボタンの背景色を変更
        if let cancelBackgroundViewType = NSClassFromString("_UIAlertControlleriOSActionSheetCancelBackgroundView") as? UIView.Type {
            cancelBackgroundViewType.appearance().subviewsBackgroundColor = Color.yellow.getColor()
        }
    }
}

private extension UIView {
    private struct AssociatedKey {
        static var subviewsBackgroundColor = "subviewsBackgroundColor"
    }

    @objc dynamic var subviewsBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.subviewsBackgroundColor) as? UIColor
        }

        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKey.subviewsBackgroundColor,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            subviews.forEach { $0.backgroundColor = newValue }
        }
    }
}

