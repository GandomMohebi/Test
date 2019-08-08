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
    
//    private func collectionViewItemSize2(){
//        if collectionViewflowLayout == nil {
//            let numberOfItemPerRow : CGFloat = 3
//            let lineSpacing : CGFloat = 5
//            let interItemSpacing : CGFloat = 5
//            let width = (allOfGymCollection.frame.width - (numberOfItemPerRow-1)*interItemSpacing)/numberOfItemPerRow
//            let height = width
//            collectionViewflowLayout = UICollectionViewFlowLayout()
//            collectionViewflowLayout.itemSize = CGSize(width: width, height: height)
//            collectionViewflowLayout.sectionInset = UIEdgeInsets.zero
//            collectionViewflowLayout.scrollDirection = .vertical
//            collectionViewflowLayout.minimumLineSpacing = lineSpacing
//            collectionViewflowLayout.minimumInteritemSpacing = interItemSpacing
//            allOfGymCollection.setCollectionViewLayout(collectionViewflowLayout, animated: true)
//
//        }
//        }
//

}
