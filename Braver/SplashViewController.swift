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
          layout.flexDirection = .row
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(global.baseView!.frame.height)
            layout.alignItems = .center
        }
        titleView = UIView()
        titleView.backgroundColor = Color.blue.getColor()
        titleView.configureLayout{ (layout)  in
          layout.isEnabled = true
          layout.flexDirection = .row
          layout.flexGrow = 1
//            LaunchScreeen.storyboardeで画像を設定した後に、全く同じUIViewを作成して、アニメーションをつける。
//            iPhone12ProMaxは167、8(4.7インチ)、11Pro(5.8インチ)は160、8+(5.5インチ),11(6.1インチ)、11ProMax(6.5インチ)は176
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
        
//        let startButton = BRButton(backgroundColor: .yellow, textColor: .blue, text: "START", textSize: 64, frame:CGRect(x: 0, y: 0, width: 210, height: 72))
//        startButton.configureLayout { (layout) in
//            layout.isEnabled = true
//        }
//        contentView.addSubview(startButton)
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
//            本当はセーフエリア とか考慮したいけど、一番初めのviewDidLayoutよりも前なのでセーフエリアが取れないので、/3で代用。(3である理由は特にない。）
            let move = (global.baseView?.frame.height)! / 3
            self.titleView.center.y -= move
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
