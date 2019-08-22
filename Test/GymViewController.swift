//
//  GymCollectionViewController.swift
//  Test
//
//  Created by Gandom on 8/4/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit
import Kingfisher
struct item {
    var imageName : String
}
var gymArray : [gym] = []

var items : [item] = [item (imageName : "2"),
                      item (imageName : "3"),
                      item (imageName : "11")]

var popularItems : [item] = [item (imageName : "3"),
                             item (imageName : "1"),
                             item (imageName : "11"),
                             item(imageName: "2")]

let cellIdentifier = "customCell"



class GymCollectionViewController: UIViewController  , UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var discountedCollectionView: UICollectionView!
    
    let backendless = Backendless.sharedInstance()!

    
    private func setupCollectionView () {
        //            popularCollectionView.delegate = self
        //            popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
        discountedCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 10: //popular
            return popularItems.count
        case 20:
            return items.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell" , for: indexPath) as! CustomCell
        
        var item: item?
        
        
        switch collectionView.tag {
        case 10:
            item = popularItems[indexPath.row]
        case 20:
            item = items[indexPath.row]
        default:
            return UICollectionViewCell()
        }
        
        guard item != nil else {
            return UICollectionViewCell()
        }
        
        
        let gym1 = gymArray[indexPath.row]
        cell.customLabelName.text = gym1.name
        cell.customImageView.image = UIImage (named : item!.imageName )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item: item?
        
        switch collectionView.tag {
        case 10:
            item = popularItems[indexPath.row]
        case 20:
            item = items[indexPath.row]
        default:
            break
        }
        
        self.performSegue(withIdentifier: "showGym", sender: item)
        print ("didseleted item \(indexPath)")
    }
    
    
    
    
    var collectionViewflowLayout : UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        get()
        
    }
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewItemsSize()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GymDetailViewController, let item = sender as? item {
            vc.item = item
        }
    }
    
    
    
    private func collectionViewItemsSize(){
        if collectionViewflowLayout == nil {
            let numberOfItemPerRow : CGFloat = 3
            let lineSpacing : CGFloat = 5
            let interItemSpacing : CGFloat = 5
            let width = (popularCollectionView.frame.width - (numberOfItemPerRow - 1)  * interItemSpacing) / numberOfItemPerRow
            let height = width
            collectionViewflowLayout = UICollectionViewFlowLayout()
            collectionViewflowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewflowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewflowLayout.scrollDirection = .vertical
            collectionViewflowLayout.minimumLineSpacing = lineSpacing
            collectionViewflowLayout.minimumInteritemSpacing = interItemSpacing
            popularCollectionView.setCollectionViewLayout(collectionViewflowLayout, animated: true)
        }
        
    }
    
    
    
    func get() {
    
        let dataStore = self.backendless.data.of(gym().ofClass());
        dataStore?.find({ items in
            let gymItems = items as! [gym]
            print(gymItems.map{$0.image})
            gymArray = gymItems
            self.popularCollectionView.reloadData()
            self.discountedCollectionView.reloadData()
        }, error: { fault in
            print(fault?.description)
        })

        
    }
    
}