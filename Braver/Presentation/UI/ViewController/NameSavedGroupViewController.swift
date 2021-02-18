//
//  NameSavedGroupViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/18.
//

import UIKit

class NameSavedGroupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    var myTableView:UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.tintColor = Color.blue.getColor()
        cell.textLabel?.textColor = Color.blue.getColor()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "3人"
        case 1:
            cell.textLabel?.text = "4人"
        case 2:
            cell.textLabel?.text = "5人"
        case 3:
            cell.textLabel?.text = "6人"
        case 4:
            cell.textLabel?.text = "7人"
        case 5:
            cell.textLabel?.text = "8人"
        case 6:
            cell.textLabel?.text = "9人"
        case 7:
            cell.textLabel?.text = "10人"
        default:
            cell.textLabel?.text = "デフォルト"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "名前を入力してね。", message: "a", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: { (layout) in
        }))
        alertController.addTextField { (text) in
            text.delegate = self
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color.yellow.getColor()
        let nav = UINavigationBar(frame: CGRect(x: 0, y: global.safeAreaTop!, width: global.baseView!.frame.width, height: 44))
        nav.barTintColor = Color.yellow.getColor()
        nav.isTranslucent = false
        
        let navItem = UINavigationItem(title: "名前の保存")

        navItem.rightBarButtonItem = UIBarButtonItem(title: "完了", style: UIBarButtonItem.Style.done, target: self, action: #selector(closeModal))
        nav.pushItem(navItem, animated: true)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 44 + global.safeAreaTop!, width: global.baseView!.frame.width, height: (global.baseView?.frame.height)!), style: UITableView.Style.insetGrouped)
        myTableView.backgroundColor = Color.yellow.getColor()
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(nav)
        view.addSubview(myTableView)
        
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
