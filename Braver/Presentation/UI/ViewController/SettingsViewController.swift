//
//  SettingsViewController.swift
//  Braver
//
//  Created by 松尾淳平 on 2021/02/14.
//

import UIKit

class SettingsViewController: BaseViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.accessoryView = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cell.tintColor = Color.blue.getColor()
//        cell.textLabel?.tintColor = Color.blue.getColor()
        cell.textLabel?.textColor = Color.blue.getColor()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "名前の入力"
        case 1:
            cell.textLabel?.text = "名前の保存"
        case 2:
            cell.textLabel?.text = "王様モード"
            
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
