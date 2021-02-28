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
    
//    UI部品の宣言
    var titleView:UIView!
    var startButton:BRButton!
    var splash:BRImageView!
    var titleLabel:BRLabel!
    var settingButton:BRButton!
    var helpButton:BRButton!
    var bottomArea:BRView!
    var goBraver2:BRButton!
    let dispose = DisposeBag()
    
//    Braver2への準備
    var backgroundColor2:Color {
        return global.isBraver ? .yellow : .red
    }
    var titleTextColor: Color{
        return global.isBraver ? .yellow : .red
    }
    var titleBackgroundColor: Color{
        return global.isBraver ? .blue : .gray
    }
    var titleText: String{
        return global.isBraver ? "BRAVER" : "BRAVER2"
    }
    var startTextColor: Color{
        return global.isBraver ? .blue : .gray
    }
    var startBackgroundColor:Color{
        return global.isBraver ? .yellow : .red
    }
    var helpTextColor: Color{
        return global.isBraver ? .blue : .gray
    }
    var helpBackgroundColor:Color{
        return global.isBraver ? .yellow : .red
    }
    var braver2Button : String{
        return global.isBraver ? "BRAVER2" : "BRAVER"
    }
    var braver2ButtonTextColor : Color{
        return global.isBraver ? .gray : .blue
    }
    var braver2ButtonBackgroundColor : Color{
        return global.isBraver ? .yellow : .red
    }
    var questionImage:String{
        return global.isBraver ? "question" : "question2"
    }
    
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
    init(backgroundColor:Color) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        self.goBraver2.rx.tap.subscribe { [self] _ in
            global.isBraver.toggle()
//            Braver2へ移行する
            let nav = SplashViewController(backgroundColor: .red)
            nav.modalTransitionStyle = .flipHorizontal
            nav.modalPresentationStyle = .fullScreen
            Router.movePageByModal(from: self, to: nav)
        }.disposed(by: dispose)
    }

    func doMove(){
        Router.showActionSheet(viewController:self,brAlertControler:
                                BRAlertController()
                                .of(title: "プレイヤー人数",textColor: Color.blue, backGroundColor: Color.blue, service: DoRankService())
                                .addAction(from: self, title: NSLocalizedString("threepeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("fourpeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("fivepeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("sixpeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("sevenpeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("eightpeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("ninepeople", comment: ""))
                                .addAction(from: self,title: NSLocalizedString("tenpeople", comment: "")))
    }
    
    
    func doLayout(){
//        BRViewでレイアウト系を決めるのか、configureLayoutを使うのか決めれていない
        let contentView = BRView(backgroundColor: self.backgroundColor2)
        contentView.configureLayout { (layout) in
          layout.isEnabled = true
          layout.flexDirection = .column
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(global.baseView!.frame.height)
          layout.alignItems = .center
          layout.justifyContent = .center
        }
        titleView = BRView(backgroundColor: self.titleBackgroundColor, frame: CGRect(x: 0, y: 0, width: 0   , height: 0),alpha: 0.0)
        titleView.configureLayout{ (layout)  in
          layout.isEnabled = true
          layout.position = .absolute
          layout.width = YGValue(global.baseView!.frame.width)
          layout.height = YGValue(integerLiteral: global.splashTilteHeight)
//            タイトルのラベルを上下中央よせにする
            layout.justifyContent = .center
            layout.alignItems = .center
        }
        
        titleLabel = BRLabel(text: self.titleText, textSize: 72, textColor: self.titleTextColor,backGroundColor: self.titleBackgroundColor,yose:NSTextAlignment.center)
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

        startButton = BRButton(backgroundColor: self.startBackgroundColor, textColor: self.startTextColor, text: "START", textSize: 64,alpha:0.0)
        startButton.configureLayout { (layout) in
            layout.isEnabled = true
            layout.position = .absolute
        }
        startButton.center = view.center
        contentView.addSubview(startButton)
        
        bottomArea = BRView(backgroundColor: self.startBackgroundColor)
        bottomArea.configureLayout { (layout) in
            layout.isEnabled = true
            layout.display = .flex
            layout.flexDirection = .row
            layout.justifyContent = .spaceBetween
            layout.alignItems = .center
            layout.marginTop = 400
            layout.paddingLeft = 50
            layout.paddingRight = 50
            layout.width = YGValue(global.baseView!.frame.width)
        }

        self.helpButton = BRButton(backgroundColor: self.helpBackgroundColor, textColor: self.helpTextColor, text: "", alpha: 0)
        self.helpButton.setImage(UIImage(named: self.questionImage), for: UIControl.State.normal)
        bottomArea.addSubview(self.helpButton)
//        self.helpButton.setShadow()
        helpButton.configureLayout { (layout) in
                layout.isEnabled = true
                layout.width = YGValue(40)
                layout.height = YGValue(40)
            }
        self.goBraver2 = BRButton(backgroundColor: self.braver2ButtonBackgroundColor, textColor: braver2ButtonTextColor, text: braver2Button, textSize: 24, alpha: 0)
        self.goBraver2.layer.cornerRadius = 10
        self.goBraver2.layer.shadowColor = UIColor.black.cgColor
        self.goBraver2.layer.shadowOpacity = 0.5
        self.goBraver2.layer.shadowOffset = .zero
//        self.goBraver2.layer.shadowRadius = 1
        goBraver2.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(150)
            layout.height = YGValue(50)
        }
        bottomArea.addSubview(goBraver2)
        
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
        UIView.animate(withDuration: 3, delay: 2, options: UIView.AnimationOptions.init()) {
            self.goBraver2.alpha = 1
        } completion: { _ in
            self.goBraver2.alpha = 1
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

