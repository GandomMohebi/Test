//
//  GymDetailViewController.swift
//  Test
//
//  Created by Gandom on 8/9/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

class GymDetailViewController: UIViewController {
    var item: gym?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = self.item {
            imageView.image = UIImage(named: item.image!)
        }

    }
    

    

}
