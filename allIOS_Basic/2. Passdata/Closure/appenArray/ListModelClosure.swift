//
//  ListModelClosure.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ListModelClosure: UIViewController {
    let tableView1 : UITableView = {
        let tableView1 = UITableView()
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.register(TableViewCell1.self, forCellReuseIdentifier: "cell1")
        return tableView1
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        layoutT()
        setupTable()
        layoutT()
    }
    func setupNavigation(){
        navigationItem.title = "List Model"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressnext))
        navigationItem.rightBarButtonItem = cancelButton
    }
    func setupTable(){
        //setupData()
        tableView1.delegate = self
        tableView1.dataSource = self
    }
   
    func layoutT(){
        view.addSubview(tableView1)
        tableView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    @objc func pressnext(){
           let thirVC = TextViewController()
           navigationController?.pushViewController(thirVC, animated: true)
       }
    
}
extension ListModelClosure: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return foods.count
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150//UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell1
            
            let food: FoodClosure = foods[indexPath.row]
            // lay anh hien thi cell
            
            if food.image != nil {
                cell.imagemain.image = food.image
            } else {
                cell.imagemain.image = UIImage(named: foods[indexPath.row].imageMain!)
            }
            
            cell.labelName.text = foods[indexPath.row].name
            cell.detailLabel.text = foods[indexPath.row].descripLabel
            
            cell.ratingLabel12.text = foods[indexPath.row].ratingLabel
            return cell
        }
        
}
