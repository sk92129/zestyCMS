//
//  ViewController.swift
//  Zesty2
//
//  Created by Sean K on 2/13/24.
//

import UIKit
import ZestySwiftContentEndpointWrapper

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var zesty: ZestySwiftContentEndpointWrapper!
    var items: [[String: String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad() // https://8-abcd-1234.api.zesty.io/v1/content/links
        
        self.zesty = ZestySwiftContentEndpointWrapper(url: "https://8-ec9d9482c9-f3vtf1.manager.zesty.io/v1/content/links")
        self.getData()
    }

    func getData() {
        self.zesty.getArray(for: "8-ec9d9482c9-f3vtf1") { (array, error) in
            if error == nil {
                self.items = array
                self.tableView.reloadData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "SubtitleCell")
        
        cell.textLabel?.text = item["name"]
        cell.detailTextLabel?.text = item["description"]
        return cell
    }
}

