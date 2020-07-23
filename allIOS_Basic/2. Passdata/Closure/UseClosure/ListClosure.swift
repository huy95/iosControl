//
//  ListClosure.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ListClosure: UIViewController {
    let tableView1 : UITableView = {
        let tableView1 = UITableView()
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.register(TableViewCell2.self, forCellReuseIdentifier: "cell1")
        tableView1.tableFooterView = UIView()
        tableView1.separatorStyle = .none
        return tableView1
    }()
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTable()
        layoutT()
        // Do any additional setup after loading the view.
    }
    func setupNavigation(){
        navigationItem.title = "Closure add List"
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
            let thirVC = CreateModel()
            navigationController?.pushViewController(thirVC, animated: true)
        // hung closure
        thirVC.passObject = { [weak self] post in
            guard let strongSelf = self else {
                return
            }
            strongSelf.posts.append(post)
            strongSelf.tableView1.reloadData()
            
        }
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
extension ListClosure: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell2
        cell.post = posts[indexPath.row]
        return cell
    }
}
