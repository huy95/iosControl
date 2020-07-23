//
//  SegmentViewVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
enum State {
    case no_process
    case processing
}
class SegmentViewVC: UIViewController {
    
    let segmentView : UISegmentedControl = {
        let segmentView = UISegmentedControl(items: ["Một chiều", "Hai chiều"])
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        segmentView.selectedSegmentIndex = 0
        // cài segment
        segmentView.backgroundColor = .yellow
        segmentView.selectedSegmentTintColor = UIColor.blue
        segmentView.addTarget(self, action: #selector(handleSegmentChoose), for: .valueChanged)
        return segmentView
    }()
    let viewDay11 = UIView()
    let viewDay21 = UIView()
    let segmentView2 : UISegmentedControl = {
        let segmentView = UISegmentedControl(items: ["Man 1", "Man 2"])
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        segmentView.selectedSegmentIndex = 0
        
        // cài segment
        segmentView.backgroundColor = .yellow
        segmentView.selectedSegmentTintColor = UIColor.blue
        segmentView.addTarget(self, action: #selector(segmentTab), for: .valueChanged)
        
        return segmentView
    }()
    @objc func segmentTab(_ sender: UISegmentedControl!) {
        print(sender.selectedSegmentIndex)
//                if sender.selectedSegmentIndex == 0 {
//                    viewDay11.isHidden = true
//                    viewDay21.isHidden = false
//                }else if (sender.selectedSegmentIndex == 1){
//                    viewDay11.isHidden = false
//                    viewDay21.isHidden = true
//                }
        sender.selectedSegmentIndex == 0  ? (viewDay11.isHidden = true,
        viewDay21.isHidden = false) :
            (viewDay11.isHidden = false,
        viewDay21.isHidden = true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewSegment()
        view.backgroundColor = .white
        setupLayout()
        
    }
    func setupLayout(){
        
        view.addSubview(segmentView)
        segmentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        segmentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        segmentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        segmentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(segmentView2)
        segmentView2.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 100).isActive = true
        segmentView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        segmentView2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        segmentView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func setupViewSegment(){
        viewDay11.isHidden = true
        viewDay21.isHidden = false
        
        viewDay11.frame = CGRect(x: 10, y: 400, width: UIScreen.main.bounds.maxX - 70, height: 110)
        viewDay11.backgroundColor = UIColor.blue
        viewDay11.layer.cornerRadius = 5
        view.addSubview(viewDay11)
        
        
        viewDay21.frame = CGRect(x: 40, y: 400, width: UIScreen.main.bounds.maxX - 70, height: 110)
        viewDay21.backgroundColor = UIColor.yellow
        viewDay21.layer.cornerRadius = 5
        view.addSubview(viewDay21)
        
    }
    
    @objc func handleSegmentChoose(){
        switch segmentView.selectedSegmentIndex {
        case 0:
            let viewDay = UIView()
            viewDay.frame = CGRect(x: 10, y: 600, width: UIScreen.main.bounds.maxX - 70, height: 110)
            viewDay.backgroundColor = UIColor.red
            viewDay.layer.cornerRadius = 5
            view.addSubview(viewDay)
        default:
            let viewDay2 = UIView()
            viewDay2.frame = CGRect(x: 40, y: 600, width: UIScreen.main.bounds.maxX - 70, height: 110)
            viewDay2.backgroundColor = UIColor.brown
            viewDay2.layer.cornerRadius = 5
            view.addSubview(viewDay2)
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
