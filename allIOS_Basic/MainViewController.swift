//
//  MainViewController.swift
//  allIOS_Basic
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sectionOne = ["UITextField", "UIButton", "UIDatePicker", "UIPickerView", "UISwitch", "UIStepper", "UISegment", "UISegmentWithViewController", "UITableView", "UICollectionView"]
    
    var sectionTwo = ["Tap Gestures", "Swipe Gestures", "Pinch Gestures", "Pan Gestures", "Rotate Gestures", "Long Press Gestures"]
    
    var sectionThree = ["Closure", "Delegate", "Notification"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Tutorial"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        //tất cả cell được sử dụng phải được đăng kí trước với tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
//    // delegate trả về tổng số sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionOne.count
        } else if section == 1{
            return sectionTwo.count
        } else {
            return sectionThree.count
        }
    }
    // delegate trả về tổng số sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // delegate trả về chiều cao sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    // delegate trả về title cho mỗi section
       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           if section == 0 {
               return "Controls"
           } else if section == 1{
               return "Gesture"
           }
           return "Pass Data"
       }
    // delegate trả về chiều cao cell
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 44
       }
    // delegate trả về cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell - trả về 1 ô tái sử dụng đối tượng hoặc thêm nó vào bảng
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = String(indexPath.row + 1) + ". " + sectionOne[indexPath.row]
        } else if indexPath.section == 1{
            cell.textLabel?.text = "\(indexPath.row + 1). \(sectionTwo[indexPath.row])"
        } else {
            cell.textLabel?.text = "\(indexPath.row + 1). \(sectionThree[indexPath.row])"
        }
        return cell
    }
    // delegate chọn cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           if indexPath.section == 0 {
               switch sectionOne[indexPath.row] {
               case "UITextField":
                   navigationController?.pushViewController(TextField(), animated: true)
                   print("test1")
               case "UIButton":
                   navigationController?.pushViewController(ButtonMC(), animated: true)
                print("test2")
               case "UIDatePicker":
                   navigationController?.pushViewController(
                    DatePickerVC(), animated: true)
               case "UIPickerView":
                   navigationController?.pushViewController(PinkerViewVC(), animated: true)
               case "UISwitch":
                   navigationController?.pushViewController(SwitchVC(), animated: true)
               case "UIStepper":
                   navigationController?.pushViewController(StepperVC(), animated: true)
               case "UISegment":
                   navigationController?.pushViewController(SegmentViewVC(), animated: true)
               case "UISegmentWithViewController":
                   navigationController?.pushViewController(SegmentViewController(), animated: true)
               case "UITableView":
                   navigationController?.pushViewController(TableViewMC(), animated: true)
               case "UICollectionView":
                   navigationController?.pushViewController(CollectionViewVC(), animated: true)
               default:
                   print("default")
               }
           } else if indexPath.section == 1{
               switch sectionTwo[indexPath.row]{
               case "Tap Gestures":
                   navigationController?.pushViewController(TapGesture(), animated: true)
               case "Swipe Gestures":
                   navigationController?.pushViewController(SwipeGesture(), animated: true)
               case "Pinch Gestures":
                   navigationController?.pushViewController(PinchGesture(), animated: true)
               case "Pan Gestures":
                   navigationController?.pushViewController(PanGesture(), animated: true)
               case "Rotate Gestures":
                   navigationController?.pushViewController(RotateGesture(), animated: true)
               case "Long Press Gestures":
                   navigationController?.pushViewController(LongGesture(), animated: true)
               default:
                   print("default")
               }
           } else {
               switch sectionThree[indexPath.row]{
               case "Closure":
                   navigationController?.pushViewController(ListClosure(), animated: true)
//                case "no Closure":
//                navigationController?.pushViewController(ListModelViewController(), animated: true)
               case "Delegate":
                   navigationController?.pushViewController(UsedDelegateVC(), animated: true)
               case "Notification":
                   navigationController?.pushViewController(Notification1View(), animated: true)
               default:
                   print("default")
               }
           }
           
       }


}
