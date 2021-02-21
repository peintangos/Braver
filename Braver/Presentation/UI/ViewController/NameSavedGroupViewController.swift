//
//  NameSavedGroupViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/18.
//

import UIKit

class NameSavedGroupViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    let service = DoRankService()
    var myTableView:UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.tintColor = Color.blue.getColor()
        cell.textLabel?.textColor = Color.blue.getColor()
        global.nameSaveNumber = indexPath.row + 3
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        getModal(indexPath:indexPath)
    }
    func getModal(indexPath:IndexPath){
//        複数回にわたって、更新してしまうことになるが問題はないと判断。
        service.setNameSavedNumber(nameSaveNumber: indexPath.row + 3)
        let alertController = UIAlertController(title: "\(global.nameSaveOrder)人目の名前を入力してね。", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: { [self] (layout) in
            service.nameSave(name: alertController.textFields![0].text!)
            self.service.addCountNameSavedOrder()
            if global.nameSaveNumber! >= global.nameSaveOrder {
//               再帰的に呼び出す。
                self.getModal(indexPath:indexPath)
            } else {
//                値を初期化する
                service.clearNameSaved()
            }
        }))
        alertController.addTextField { (text) in
            text.delegate = self
        }
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.myTableView.deselectRow(at: indexPath, animated: true)
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
        navItem.rightBarButtonItem?.tintColor = Color.blue.getColor()
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
