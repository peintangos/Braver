//
//  Router.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/23.
//

import Foundation
import UIKit

class Router {
    static func movePageByModal(from:UIViewController,to:UIViewController){
        from.present(to, animated: true) {}
    }
    static func movePageByPush(from:UIViewController,to:UIViewController){
        from.navigationController?.pushViewController(to, animated: true)
    }
    static func showActionSheet(viewController:UIViewController,brAlertControler:BRAlertController){
        viewController.present(brAlertControler.alertController, animated: true) {
        }
        
    }
    
}
