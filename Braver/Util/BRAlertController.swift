//
//  BRAlertController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import UIKit

class BRAlertController {
    var alertController:UIAlertController!
    
    func of(title:String! = nil,titleTextColor:Color = .blue,message:String! = nil,preferredStyle:UIAlertController.Style = .actionSheet,textColor:Color = .blue,backGroundColor:Color = .blue,isDefaultBackButton:Bool = true) -> BRAlertController{
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertController.view.tintColor = textColor.getColor()
        if isDefaultBackButton {
            alertController.addAction(UIAlertAction.init(title: "戻る", style: UIAlertAction.Style.cancel, handler: { (UIAlertAction) in
            }))
        }
        let subview = (alertController
                    .view.subviews.first?.subviews.first?.subviews.first!)! as UIView
          subview.layer.cornerRadius = 1
        subview.backgroundColor = Color.yellow.getColor()
        
//        戻るボタンの背景色を変更
        alertController.itemBackgroundColor()

        
        return self
    }
    
    func addAction(from:UIViewController,title:String = "",style:UIAlertAction.Style = .default) -> BRAlertController{
        self.alertController.addAction(UIAlertAction.init(title: title, style: UIAlertAction.Style.default, handler: { (action) in
            Router.movePageByModal(from: from, to: CommonBraverViewController(totalPlayerNumber: Int(title.dropLast())!, selfNumber: 1))
        }))
        return self
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



extension UIAlertController {
    func itemBackgroundColor() {
        // ここでキャンセルボタンの背景色を変更
        if let cancelBackgroundViewType = NSClassFromString("_UIAlertControlleriOSActionSheetCancelBackgroundView") as? UIView.Type {
            cancelBackgroundViewType.appearance().subviewsBackgroundColor = Color.yellow.getColor()
        }
    }
}

extension UIView {
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

