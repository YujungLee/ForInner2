//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 24..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var inButton: UIButton!

    var searchResult: SearchResult!//segue가 실행되기 전까지는 무슨 값이 들었는지 모르니까 optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tint color(버튼들 기본색) 바꾸기
        view.tintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        //popupview 테두리 둥글게
        popUpView.layer.cornerRadius = 10

        if searchResult != nil{
            updateUI()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //custom transition delegate쓸거라고 알림 + load view controller
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func updateUI() {
        titleLabel.text = searchResult.name
        
        if searchResult.artistName.isEmpty {
            placeLabel.text = "Unknown"
        } else {
            placeLabel.text = searchResult.artistName
        }
        //kindLabel.text = searchResult.kind//기타 데이터도 이렇게 해주면됨
        dateLabel.text = "피곤하다.."
        priceLabel.text = "여기는 얼만지적음"
    }
    
    
}


extension DetailViewController: UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController( presented: UIViewController,
    presentingViewController presenting: UIViewController, sourceViewController source: UIViewController)
    -> UIPresentationController? {
        return DimmingPresentationController( presentedViewController: presented,
                                              presentingViewController: presenting)
    }
}


