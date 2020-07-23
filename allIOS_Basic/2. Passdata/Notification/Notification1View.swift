//
//  Notification1View.swift
//  allIOS_Basic
//
//  Created by Huy on 7/22/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class Notification1View: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var feelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Get Data"
        NotificationCenter.default.addObserver(self, selector: #selector(notification), name: .notificationNamePost, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func notification(_ notification: Notification){
        if let post = notification.object as? Post{
            titleLabel.text = post.title
            feelLabel.text = post.feel
        }
        print("Notification1ViewController")
        
    }


    @IBAction func nextAction(_ sender: Any) {
        navigationController?.pushViewController(Notification2View(), animated: true)
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
