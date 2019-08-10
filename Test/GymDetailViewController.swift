//
//  GymDetailViewController.swift
//  Test
//
//  Created by Gandom on 8/9/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

class GymDetailViewController: UIViewController {
    var item: item?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = self.item {
            imageView.image = UIImage(named: item.imageName)
        }
        // Do any additional setup after loading the view.
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
