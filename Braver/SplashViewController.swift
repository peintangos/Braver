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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureGloablValiables()
        doLayout()
        
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
        let title = UIView()
        title.backgroundColor = Color.blue.getColor()
        title.configureLayout{ (layout)  in
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
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name:"Arial", size: 20.0)
        titleLabel.text = "BRAVER"
        titleLabel.textColor = Color.yellow.getColor()
        titleLabel.configureLayout { (layout) in
            layout.isEnabled = true
        }
        title.addSubview(titleLabel)
        contentView.addSubview(title)
    
        view.addSubview(contentView)
        // 5
        contentView.yoga.applyLayout(preservingOrigin: true)
    }
    func configureGloablValiables(){
        global.baseView = self.view
        print(self.view)
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
