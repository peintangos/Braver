//
//  SettingsViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import UIKit
import RxSwift
import RxCocoa

class SettingsViewController: BaseViewController, UITableViewDataSource {
    let settingsViewModel = SettingsViewModel()
    let dispose = DisposeBag()
    var isOmitSwitch =  UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var isNameSavedSwitch =  UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var isOsamaSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.tintColor = Color.blue.getColor()
        cell.textLabel?.textColor = Color.blue.getColor()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "名前の入力"
            cell.accessoryView = isOmitSwitch
        case 1:
            cell.textLabel?.text = "名前の保存"
            cell.accessoryView = isNameSavedSwitch
        case 2:
            cell.textLabel?.text = "王様モード"
            cell.accessoryView = isOsamaSwitch
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: (global.baseView?.frame.width)!, height: (global.baseView?.frame.height)!),style: .grouped)
        self.tableView.dataSource = self
        self.tableView.backgroundColor = Color.yellow.getColor()
        self.view.addSubview(tableView)
        doBind()
    }
    override func viewDidAppear(_ animated: Bool) {
        doBind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        画面を離れるときに保存する。
        try! DoRankService().updateUserDefaults(isOmit:settingsViewModel.isNameOmittedBehaviorSubject.value(), isNameSaved: settingsViewModel.isNameSavedBehaviorSubject.value(), isOsama: settingsViewModel.isKingRuleBehaviorSubject.value())
    }
    func doBind(){
        self.isOmitSwitch.rx.isOn.bind(to: settingsViewModel.isNameOmittedBehaviorSubject).disposed(by: dispose)
        self.isNameSavedSwitch.rx.isOn.bind(to: settingsViewModel.isNameSavedBehaviorSubject).disposed(by: dispose)
        self.isOsamaSwitch.rx.isOn.bind(to: settingsViewModel.isKingRuleBehaviorSubject).disposed(by: dispose)
    }
    override func viewWillAppear(_ animated: Bool) {
//        isOnを変えるのではなく、setしないと値が変わらないことに注意。あと、ここはViewModel使ってもっとうまくやる。
        self.isOmitSwitch.setOn(global.defaults.bool(forKey: "isOmit"), animated: true)
        self.isNameSavedSwitch.setOn(global.defaults.bool(forKey: "isNameSaved"), animated: true)
        self.isOsamaSwitch.setOn(global.defaults.bool(forKey: "isOsama"), animated: true)
        
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
