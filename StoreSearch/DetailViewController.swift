//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 24..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var webView: UIWebView!


    var searchResult: SearchResult.Entry!//segue가 실행되기 전까지는 무슨 값이 들었는지 모르니까 optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tint color(버튼들 기본색) 바꾸기
        //view.tintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        //popupview 테두리 둥글게
        //popUpView.layer.cornerRadius = 10

        let url = NSURL (string: searchResult.url);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        

        
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //custom transition delegate쓸거라고 알림 + load view controller
    /*
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }
 */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowPayment" {
            let paymentViewController = segue.destinationViewController as! PaymentViewController
            let data = searchResult
                paymentViewController.searchResult = data
        }

    }
    
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}




