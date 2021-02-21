//
//  SplashViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/17.
//

import UIKit
import YogaKit
import RxSwift
import RxCocoa
let global = GlobalValiables()
class SplashViewController: UIViewController {
    
    var titleView:UIView!
    var startButton:BRButton!
    var splash:BRImageView!
    var titleLabel:BRLabel!
    var settingButton:BRButton!
    var helpButton:BRButton!
    var bottomArea:BRView!
    let dispose = DisposeBag()
    private let doRankService = DoRankService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureGloablValiables()
        doLayout()
        doAnimation()
        doRouter()
        doRankService.initNameSave()
    }
    
    func doRouter(){
        self.startButton.rx.tap.subscribe { (layout) in
            self.doMove()
        }.disposed(by: dispose)
        
        self.helpButton.rx.tap.subscribe { [self] (layout) in
            let vc = QuestionViewController()
            vc.title = "説明画面"
            
            let nav = UINavigationController(rootViewController: vc)
//            基本的に、UINavigationの設定はQuestionViewController()で行うが、modalタイプだけはこちらでで対応する。
            nav.modalPresentationStyle = .overFullScreen
            Router.movePageByModal(from: self, to: nav)
        }.disposed(by: dispose)
    }

    func doMove(){
        Router.showActionSheet(viewController:self,brAlertControler:
                                BRAlertController()
                                .of(title: "プレイヤー人数",textColor: Color.blue, backGroundColor: Color.blue, service: DoRankService())
                                .addAction(from: self, title: "3人")
                                .addAction(from: self,title: "4人")
                                .addAction(from: self,title: "5人")
                                .addAction(from: self,title: "6人")
                                .addAction(from: self,title: "7人")
                                .addAction(from: self,title: "8人")
                                .addAction(from: self,title: "9人")
                                .addAction(from: self,title: "10人"))
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
        
        titleLabel = BRLabel(text: "BRAVER", textSize: 72, textColor: .yellow,backGroundColor: .blue,yose:NSTextAlignment.center)
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

        startButton = BRButton(backgroundColor: .yellow, textColor: .blue, text: "START", textSize: 64,alpha:0.0)
        startButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.position = .absolute
        }
        startButton.center = view.center
        contentView.addSubview(startButton)
        
        bottomArea = BRView(backgroundColor: .yellow)
        bottomArea.configureLayout { (layout) in
            layout.isEnabled = true
            layout.display = .flex
            layout.flexDirection = .row
            layout.justifyContent = .flexStart
            layout.marginTop = 400
            layout.marginLeft = 100
            layout.width = YGValue(global.baseView!.frame.width)
            
        }

        self.helpButton = BRButton(backgroundColor: .yellow, textColor: .yellow, text: "", alpha: 0)
        self.helpButton.setImage(UIImage(named: "question"), for: UIControl.State.normal)
//        self.helpButton.setShadow()
        helpButton.configureLayout { (layout) in
                layout.isEnabled = true
                layout.width = YGValue(40)
                layout.height = YGValue(40)
            }
        bottomArea.addSubview(self.helpButton)
        
        contentView.addSubview(bottomArea)
        
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
        UIView.animate(withDuration: 3, delay: 2, options: UIView.AnimationOptions.init()) {
            self.helpButton.alpha = 1
        } completion: { _ in
            self.helpButton.alpha = 1
        }
        
    }
    @objc func closeModal(){
        self.dismiss(animated: true, completion: nil)
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

