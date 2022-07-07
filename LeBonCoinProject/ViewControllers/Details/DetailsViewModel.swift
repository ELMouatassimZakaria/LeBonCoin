//
//  ViewController.swift
//  LeBonCoinProject
//
//  Created by Zakaria Elmoutassim on 07/07/2022.
//

import UIKit

class DetailsViewModel: ViewModel {

    var items: (product : Product, category: String)
 
    init(item: (product : Product, category: String)) {
        self.items = item
    }

}


