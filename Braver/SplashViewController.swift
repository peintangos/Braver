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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureGloablValiables()
        doLayout()
        doAnimation()
    }
    func doLayout(){
        self.view.backgroundColor = Color.yellow.getColor()
        
        let contentView = UIView()
        contentView.backgroundColor = Color.yellow.getColor()
        contentView.configureLayout { (layout) in
          layout.isEnabled = true
          layout.flexDirection = .column
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(global.baseView!.frame.height)
          layout.alignItems = .center
          layout.justifyContent = .center
        }
        titleView = UIView()
        titleView.backgroundColor = Color.blue.getColor()
        titleView.configureLayout{ (layout)  in
          layout.isEnabled = true
          layout.position = .absolute
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = 160
            
//            タイトルのラベルを上下中央よせにする
            layout.justifyContent = .center
            layout.alignItems = .center
        }
        
        let titleLabel = BRLabel(text: "BRAVER", size: 72, color: .yellow)
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

        startButton = BRButton(backgroundColor: .yellow, textColor: .blue, text: "START", textSize: 64, frame:CGRect(x: 0, y: 0, width: 210, height: 72))
        startButton.alpha = 0
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
    
        UIView.animate(withDuration: 2.0) {
//            本当はセーフエリア とか考慮したいけど、一番初めのviewDidLayoutよりも前なのでセーフエリアが取れないので、/4で代用。(3である理由は特にない。）
            let move = (global.baseView?.frame.height)! / 4
            self.titleView.center.y -= move
        }
        
        UIView.animate(withDuration: 1.0) { [self] in
            sleep(1)
            splash.alpha = 0
        } completion: { [self] (bool) in
            splash.alpha = 0
        }
        
        UIView.animate(withDuration: 3.0) { [self] in
            startButton.alpha = 1
        } completion: { [self] (bool) in
            startButton.alpha = 1
        }
        
        UIView.animate(withDuration: 3.0) {
            let move = (global.baseView?.frame.height)! / 7
            self.startButton.center.y += move
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
