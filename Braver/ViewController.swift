//
//  ViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/01/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imgae = UIImageView(frame: CGRect(x: 0, y: 0, width: 140, height: 140))
        imgae.image = UIImage(named: "splash_16")
        imgae.center = view.center
        imgae.contentMode = .scaleAspectFit
        self.view.addSubview(imgae)
    }


}

