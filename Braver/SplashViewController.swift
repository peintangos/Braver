//
//  SplashViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit
import YogaKit
let global = GlobalValiables()
class SplashViewController: UIViewController {
    
    var titleView:UIView!
    var startButton:BRButton!
    var splash:BRImageView!
    var titleLabel:BRLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureGloablValiables()
        doLayout()
        doAnimation()
    }
    func doLayout(){
//        BRViewでレイアウト系を決めるのか、configureLayoutを使うのか決めれていない
        let contentView = BRView(backgroundColor: .yellow)
        contentView.configureLayout { (layout) in
          layout.isEnabled = true
          layout.flexDirection = .column
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(global.baseView!.frame.height)
          layout.alignItems = .center
          layout.justifyContent = .center
        }
        titleView = BRView(backgroundColor: .blue, frame: CGRect(x: 0, y: 0, width: 0   , height: 0),alpha: 0.0)
        titleView.configureLayout{ (layout)  in
          layout.isEnabled = true
          layout.position = .absolute
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(integerLiteral: global.splashTilteHeight)
//            タイトルのラベルを上下中央よせにする
            layout.justifyContent = .center
            layout.alignItems = .center
        }
        
        titleLabel = BRLabel(text: "BRAVER", size: 72, color: .yellow)
        titleLabel.configureLayout { (layout) in
            layout.isEnabled = true
        }
        titleView.addSubview(titleLabel)
        contentView.addSubview(titleView)
        
        splash = BRImageView(name: "splash_24", frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        splash.configureLayout { (layout) in
            layout.isEnabled = true
            layout.position = .absolute
        }
        splash.center = view.center
        contentView.addSubview(splash)

        startButton = BRButton(backgroundColor: .yellow, textColor: .blue, text: "START", textSize: 64, frame:CGRect(x: 0, y: 0, width: 210, height: 72),alpha:0.0)
        startButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.position = .absolute
        }
        startButton.center = view.center
        contentView.addSubview(startButton)
        
        view.addSubview(contentView)

        contentView.yoga.applyLayout(preservingOrigin: true)
        
    }
    func configureGloablValiables(){
        global.baseView = self.view
    }
    override func viewWillLayoutSubviews() {
//        セーフエリアはviewWillLayoutSubviews以降で取れるらしい。
        global.safeArea = self.view.safeAreaInsets
        global.safeAreaTop = self.view.safeAreaInsets.top
        global.safeAreaBottom = self.view.safeAreaInsets.bottom
    }
    
    func doAnimation(){
    
        UIView.animate(withDuration: 1.0) { [self] in
            splash.alpha = 0
        } completion: { [self] (bool) in
            splash.alpha = 0
        }
        UIView.animate(withDuration: 3.0, delay: 1.0, options: UIView.AnimationOptions.init()) {
            let move = (global.baseView?.frame.height)! / 4
            self.titleView.center.y -= move
        } completion: { _ in
        }

        UIView.animate(withDuration: 3, delay: 1, options: UIView.AnimationOptions.init()) {
            self.titleView.alpha = 1
        } completion: { _ in
            self.titleView.alpha = 1
        }
        
        UIView.animate(withDuration: 3, delay: 1, options: UIView.AnimationOptions.init()) {
            self.titleLabel.alpha = 1
        } completion: { _ in
            self.titleLabel.alpha = 1
        }
        
        UIView.animate(withDuration: 3, delay: 1, options: UIView.AnimationOptions.init()) {
            self.startButton.alpha = 1
        } completion: { _ in
            self.startButton.alpha = 1
        }
        
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
