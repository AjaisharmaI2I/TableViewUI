//
//  ViewController.swift
//  AccordionView
//
//  Created by Ideas2IT on 24/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var myData = [MyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myData = [
            MyData(title: "User", options: ["User1", "User2"]),
            MyData(title: "Address", options: ["Address1","Address2"]),
            MyData(title: "Card", options: ["card1"]),
            MyData(title: "Email", options: ["email"]),
            MyData(title: "Phone", options: ["Phone1", "Phone2", "Phone3"]),
            MyData(title: "Vehical", options: ["car", "Bike"]),
            MyData(title: "Assets", options: ["Iphone", "MacBook", "iPad"])
        ]
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = myData[section]
        
        if data.isExpanded {
            return data.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            cell.titleLbl.text = myData[indexPath.section].title
            cell.descLbl.text = "this is to show the Name"
            cell.selectedOptLbl.text = "Selected Option Lable"
            cell.iconImage.image = UIImage(systemName: "person")
            
            if myData[indexPath.section].isExpanded {
                cell.editBtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            } else {
                cell.editBtn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            }
            cell.editBtn.tag = indexPath.section
            cell.editBtn.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
            return cell
        } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = myData[indexPath.section].options[indexPath.row - 1]
                return cell
        }
    }
    
    @objc func editPressed(_ sender: UIButton) {
        let section = sender.tag
        myData[section].isExpanded = !myData[section].isExpanded
        tableView.reloadSections([section], with: .none)
    }
}


