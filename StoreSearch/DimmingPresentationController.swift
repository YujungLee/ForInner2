//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Yujung Lee on 2016. 6. 24..
//  Copyright © 2016년 YujungLee. All rights reserved.
//

//SearchView -> DetailView presentation controller

import Foundation
import UIKit

class DimmingPresentationController: UIPresentationController {//UIPresentationController
    
    //overriding해서 customize....
    
    override func shouldRemovePresentersView() -> Bool {
        return false//presenter view를 남긴다.(이 경우 searchview)
    }
    
}