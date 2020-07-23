//
//  CollectionViewVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController {
    let collectionView: UICollectionView = {
        // khởi tạo flowLayout
        // Flow layout là một dạng line-based layout
        // layout object sẽ sắp xếp các items trên một hàng, và tính toán làm sao để có thể chứa càng nhiều items trên hàng đó càng tốt. Tới khi không còn thể nhét thêm bất cứ item nào nữa thì nó sẽ tạo ra một hàng mới và bắt đầu lặp lại công việc này cho đến khi hết tất cả items
        let layout = UICollectionViewFlowLayout()
        // khởi tạo collectionView truyền vào layout vừa khởi tạo ở trên
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        // dang ki cell
        collection.register(CellCollection.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .white
        // bo indicator
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        // chống nảy trong collectionView
        collection.bounces = false
        // scroll theo chieu
        //        layout.scrollDirection = .horizontal // ngang
        layout.scrollDirection = .vertical
        return collection
    }()
    var foods = [Foody]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupData()
        setupLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func setupData(){
        
        let food1 = Foody(imageName: "cafedeadend.jpg", name: "Cafe Deadend", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        let food2 = Foody(imageName: "homei.jpg", name: "Homei", description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
        let food3 = Foody(imageName: "teakha.jpg", name: "Teakha", description: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,")
        let food4 = Foody(imageName: "cafeloisl.jpg", name: "Cafe Loisl", description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        let food5 = Foody(imageName: "petiteoyster.jpg", name: "Petite Oyster", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
        let food6 = Foody(imageName: "forkeerestaurant.jpg", name: "For Kee Restaurant", description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.")
        let food7 = Foody(imageName: "posatelier.jpg", name: "Po's Atelier", description: "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
        let food8 = Foody(imageName: "bourkestreetbakery.jpg", name: "Bourke Street Bakery", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.")
        let food9 = Foody(imageName: "haighschocolate.jpg", name: "Haigh's Chocolate", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
        let food10 = Foody(imageName: "palominoespresso.jpg", name: "Palomino Espresso", description: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.")
        
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
extension CollectionViewVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCollection
        cell.food = foods[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ((collectionView.frame.size.width - 1) / 2)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = foods[indexPath.row]
        let zoomVC = ZoomView()
        zoomVC.image = UIImage(named: item.imageName)
        present(zoomVC, animated: true, completion: nil)
        print(foods.count)
    }
}

