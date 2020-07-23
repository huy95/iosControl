//
//  ScrollViewVC.swift
//  allIOS_Basic
//
//  Created by Huy on 7/20/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ScrollViewVC: UIViewController {
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        // kich co scrollView
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2 )
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let scrollView2 : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height/2 , width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/2)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    var datas : [Name] = []
    var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.pageIndicatorTintColor = .cyan
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.currentPage = 0
        return pageControl
    }()
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
 
    
    
    var timer: Timer!
    override func viewDidLoad() {
        data1()
        view.backgroundColor = .white
        title = "Scroll view"
        super.viewDidLoad()
        setupCompenion()
        // Do any additional setup after loading the view.
        setupPage()
        addContentScrollHor(datas)
        addContentScrollVer(datas)
        // tu nhay sang hinh khacs
        timerSet()
    }
    func data1(){
        datas = [
            Name(image: "durian", label: "Quả sầu  "),
            Name(image: "mango", label: "Quả xoài"),
            Name(image: "orange", label: "Quả cam"),
            Name(image: "coconut", label: "Quả dừa"),
            Name(image: "grape", label: "Quả nho"),
            
        ]
    }
    func setupCompenion(){
        view.addSubview(scrollView)
        view.addSubview(scrollView2)
        view.addSubview(pageControl)

        // gán delegate vào scrollView, đồng thời class cha phải kế thừa
                scrollView2.delegate = self
    }
    func setupPage(){
        pageControl.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: 100, height: 20)
        pageControl.center.x = view.center.x
        pageControl.numberOfPages = datas.count
        pageControl.currentPage = 0
        // mang pageControl lên mặt trên cùng
        view.bringSubviewToFront(pageControl)
    }
    func addContentScrollHor(_ dataNames: [Name]) {
        
        for i in 0 ..< dataNames.count {
            // co anh trong scrollView
            let subView = CustomView(frame: CGRect(x: 0, y: height/2 * CGFloat(i),
                                                   width: width, height: height/2 ))
            
            subView.imageView.image = UIImage(named: dataNames[i].image)
            subView.nameLabel.text = dataNames[i].label
            
            scrollView.addSubview(subView)
        }
        // kich co anh so voi scroll
        scrollView.contentSize = CGSize(width: width, height: scrollView.frame.height * CGFloat(datas.count))
    }
    func addContentScrollVer(_ dataNames: [Name]) {
        for i in 0..<dataNames.count {
            // chinh chieu cao canh
            let subView = Custom2View(frame: CGRect(x: width * CGFloat(i), y: 0 ,
                                                    width: width, height: height/2))
            
            subView.imageView.image = UIImage(named: dataNames[i].image)
            subView.desLabel.text = dataNames[i].label
            // them 1 phan tu khong co trong data
            var dataViews = [Custom2View]()
            dataViews.append(subView)
            scrollView2.addSubview(subView)
        }
        scrollView2.contentSize = CGSize(width: scrollView.frame.width * CGFloat(dataNames.count), height: height/2)
    }
    
    func timerSet(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    var xOffset: CGFloat = 0
    @objc func timerAction() {
        
        if xOffset > (3 * scrollView2.bounds.width) {
            xOffset = 0
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    self.scrollView2.contentOffset.x = self.xOffset
                }
            }
            
        }else  {
            xOffset += scrollView2.bounds.width
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.7) {
                    self.scrollView2.contentOffset.x = self.xOffset
                }
            }
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
extension ScrollViewVC: UIScrollViewDelegate {
func scrollViewDidScroll(_ scrollView: UIScrollView) {
     // Xác định toạ độ khung nhìn của scrollView để thay đổi số trang hiện tại của pageControl
     let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
     pageControl.currentPage = Int(pageIndex)


     // MARK: Tạo animate khi trượt các thành phần trong scrollView
//     let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//     let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
//
//     let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
//     let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
//
//     let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
//     let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
//
//     let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
//
//     if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//         dataViews[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//         dataViews[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//     } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//         dataViews[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//         dataViews[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//     } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//         dataViews[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//         dataViews[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//
//     } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//         dataViews[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//         dataViews[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
     }
 }
