//
//  PaymentViewController.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 24..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var countStepper: UIStepper!
    
    @IBOutlet weak var totalTextField: UITextField!
    
    var searchResult: SearchResult.Entry!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        countStepper.wraps = true
        countStepper.autorepeat = true
        countStepper.maximumValue = 50
        countStepper.minimumValue = 1

        
        
        if searchResult != nil{
            updateUI()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func updateUI() {
        titleLabel.text = searchResult.title
        priceLabel.text = String(searchResult.price) + " ₩"
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func stepperValueChanged(sender: UIStepper) {
        countLabel.text = Int(sender.value).description
        
        if searchResult != nil{
            let total = Int(sender.value) * searchResult.price
            print(total)
            totalTextField.text = String(total)
        }
    }

}
