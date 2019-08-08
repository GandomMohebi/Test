//
//  SportViewController.swift
//  Test
//
//  Created by Gandom on 8/5/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

struct itemSport {
    var imageName : String
}

var itemsS : [itemSport] = [itemSport (imageName : "2"),
                          itemSport (imageName : "3"),
                          itemSport(imageName : "11")]






class SportViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsS.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.customLabelName.text = "Sport"
        cell.customImageView.image = UIImage(named: itemsS[indexPath.item].imageName)
        return cell

    }
//    func collectionView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//                return "header 1"
//            }
    
   private func setup(){
        sportCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
    }

    @IBOutlet weak var sportCollectionView: UICollectionView!
    
    
    var collectionViewflowLayout : UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewItemSize1()
    }
    
    private func collectionViewItemSize1(){
        if collectionViewflowLayout == nil {
            let numberOfItemPerRow : CGFloat = 3
            let lineSpacing : CGFloat = 5
            let interItemSpacing : CGFloat = 5
            let width = (sportCollectionView.frame.width - (numberOfItemPerRow-1)*interItemSpacing)/numberOfItemPerRow
            let height = width
            collectionViewflowLayout = UICollectionViewFlowLayout()
            collectionViewflowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewflowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewflowLayout.scrollDirection = .vertical
            collectionViewflowLayout.minimumLineSpacing = lineSpacing
            collectionViewflowLayout.minimumInteritemSpacing = interItemSpacing
            sportCollectionView.setCollectionViewLayout(collectionViewflowLayout, animated: true)
            
            
        }
    }
    
    

    

}
