//
//  TableViewMC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class TableViewMC: UIViewController {
    let tableUnib: UITableView = {
        let tableUnib = UITableView()
        tableUnib.translatesAutoresizingMaskIntoConstraints = false
        //bỏ cell footer- chan trang
        //tableUnib.tableFooterView = UIView()
        // bỏ separator - giai phan cach
        tableUnib.separatorStyle = .none
        //thanh doc
        tableUnib.showsVerticalScrollIndicator = false
        tableUnib.register(UINib(nibName: "CellCib", bundle: nil), forCellReuseIdentifier: "cellcib")
        return tableUnib
    }()
    var foods : [Food] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTable()
        setupLayout()
        setupData()
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(tableUnib)
        
        tableUnib.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableUnib.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        tableUnib.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        tableUnib.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    }
    func setupTable(){
        tableUnib.dataSource = self
        tableUnib.delegate = self
    }
    func setupData(){
        
        let food1 = Food(imageName: "cafedeadend.jpg", name: "Cafe Deadend", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", isSelected: false )
        let food2 = Food(imageName: "homei.jpg", name: "Homei", description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,", isSelected: false )
        let food3 = Food(imageName: "teakha.jpg", name: "Teakha", description: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,", isSelected: false )
        let food4 = Food(imageName: "cafeloisl.jpg", name: "Cafe Loisl", description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", isSelected: false )
        let food5 = Food(imageName: "petiteoyster.jpg", name: "Petite Oyster", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isSelected: false )
        let food6 = Food(imageName: "forkeerestaurant.jpg", name: "For Kee Restaurant", description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.", isSelected: false )
        let food7 = Food(imageName: "posatelier.jpg", name: "Po's Atelier", description: "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", isSelected: false )
        let food8 = Food(imageName: "bourkestreetbakery.jpg", name: "Bourke Street Bakery", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", isSelected: false )
        let food9 = Food(imageName: "haighschocolate.jpg", name: "Haigh's Chocolate", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.", isSelected: false )
        let food10 = Food(imageName: "palominoespresso.jpg", name: "Palomino Espresso", description: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.", isSelected: false )
        
        foods = [food1, food2, food3, food4, food5, food6, food7, food8, food9, food10]
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
extension TableViewMC: UITableViewDelegate, UITableViewDataSource {
    // hàm này trả về section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // hàm này trả về số hàng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
      
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
            return "Cell có file xib"
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cellcib", for: indexPath) as! CellCib
      
        cell1.foodCell = foods[indexPath.row]
        // B3: đăng kí dùng closure
        // dung closure la phai co weak self: [weak self]
        cell1.passAction = {[weak self] in
            // check self co bi nil khong, neu khong bi nil thi gan self cho strongSelf
            guard let strongSelf = self else { return }
            strongSelf.foods[indexPath.row].isSelected = !strongSelf.foods[indexPath.row].isSelected
            tableView.reloadData()
        }
        cell1.truyenFoodName = { name in
            print(name)
            }
            return cell1
             
    }
    // chieu cao cua cell
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
       }
       // edit cell
       func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }
       // xoa cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete{
               foods.remove(at: indexPath.row)
               tableView.reloadData()
           }
       }
       // chon vao cell
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           print("Đã press cell \(foods[indexPath.row].name)")
       }
    
}
