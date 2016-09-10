//
//  ViewController.swift
//  ScrollView
//
//  Created by Kotaro Suto on 2016/09/10.
//  Copyright © 2016年 Kotaro Suto. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!//最上位のスクロールビュー
    let inchPerM = 6413.5
    var currentPosition = Float()
    
    override func viewDidLoad() {
        scrollView.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGFloat(10000 * inchPerM) + 50)
        scrollView.bounces = false
        //scrollView.contentOffset = CGPoint(x: 0,y: 10000 * inchPerM)
        let contentView = UIView()
        contentView.frame = CGRectMake(0, 0, self.view.frame.size.width, CGFloat(10000 * inchPerM))
        contentView.backgroundColor = UIColor.whiteColor()
        for var i = 0.0; i < 10001; i++ {
            let oneHundredLabel = UILabel()
            oneHundredLabel.frame = CGRectMake(0, CGFloat(i * inchPerM), self.view.frame.size.width, 50)
            if i < 1000 {
                oneHundredLabel.text = "\(Int(i))m"
            } else {
                oneHundredLabel.text = "\(Int(i/1000))km \(Int((i%1000)))m"
            }
            oneHundredLabel.textColor = UIColor.blackColor()
            oneHundredLabel.backgroundColor = UIColor.magentaColor()
            oneHundredLabel.textAlignment = NSTextAlignment.Center
            oneHundredLabel.font = UIFont.systemFontOfSize(50)
            contentView.addSubview(oneHundredLabel)
            print("i = \(i)")
        }
        scrollView.addSubview(contentView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var currentPos = scrollView.contentOffset.y / CGFloat(inchPerM)
        currentPos = currentPos * 100
        currentPos = round(currentPos)
        currentPosition = Float(currentPos) / 100
        print(" 距離 = \(scrollView.contentOffset.y / CGFloat(inchPerM)) \n 現在距離 = \(currentPosition)")

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    


}

