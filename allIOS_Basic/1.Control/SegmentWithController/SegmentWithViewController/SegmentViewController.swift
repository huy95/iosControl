//
//  SegmentViewController.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

enum TabIndex: Int {
    case firstChildTab = 0
    case secondChildTab = 1
}

class SegmentViewController: UIViewController {
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
    lazy var pinkVC: PickViewController = {
           let vc = PickViewController()
           return vc
       }()
       
       lazy var greenVC: GreenViewController = {
           let vc = GreenViewController()
           return vc
       }()
    var containerView : UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    var currentViewController: UIViewController?
    @objc func handleSegmentChoose(_ sender: UISegmentedControl){
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParent()
        
        displayCurrentTab(sender.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        segmentView.selectedSegmentIndex = TabIndex.firstChildTab.rawValue
        displayCurrentTab(TabIndex.firstChildTab.rawValue)
        // Do any additional setup after loading the view.
    }
    
    func displayCurrentTab(_ tabIndex: Int){
           if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {
            self.addChild(vc)
            vc.didMove(toParent: self)
               vc.view.frame = self.containerView.bounds
               self.containerView.addSubview(vc.view)
               self.currentViewController = vc
           }
       }
       func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController?{
         var vc: UIViewController?
         switch index {
         case TabIndex.firstChildTab.rawValue:
             vc = pinkVC
         case TabIndex.secondChildTab.rawValue:
             vc = greenVC
         default:
         return nil
        }
        
        return vc
    }
    
    func setupLayout(){
        
        view.addSubview(segmentView)
        segmentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        segmentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        segmentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        segmentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: segmentView.bottomAnchor, constant: 100).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
