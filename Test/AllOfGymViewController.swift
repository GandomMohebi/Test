//
//  AllOfGymViewController.swift
//  Test
//
//  Created by Gandom on 8/7/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

let itemsGym = itemsS

class AllOfGymViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsGym.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)as! CustomCell
        cell.customLabelName.text = "All of gym"
        cell.customImageView.image = UIImage (named: itemsGym[indexPath.item].imageName)
        return cell
    }
    
  private  func setup (){
    allOfGymCollection.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        collectionViewItemSize2()
        
    }
    @IBOutlet weak var allOfGymCollection: UICollectionView!
    
//    var collectionViewflowLayout : UICollectionViewFlowLayout ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
//    
}
