import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var discountCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var data = [gym]();
    var discount = [gym]();
    var popular = [gym]();
    
    var collectionViewflowLayout : UICollectionViewFlowLayout!;
    let backendLess = Backendless.sharedInstance();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewItemsSize();
        get {
            DispatchQueue.main.async {
                self.setupCollectionView();
            }
            
        }
    }
    
    private func setupCollectionView () {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        discountCollectionView.dataSource = self
        discountCollectionView.delegate = self
        
        popularCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
        discountCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
        
        popularCollectionView.reloadData();
        discountCollectionView.reloadData();
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == discountCollectionView {
            return discount.count;
        }
        
        return popular.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell;
        
        if collectionView == discountCollectionView {
            let rowData = discount[indexPath.row];
            cell.customLabelName.text = rowData.name;
            if let image = rowData.image {
                URLSession.shared.dataTask(with: URL(string: image)!) { (data, response, error) in
                    DispatchQueue.main.async {
                        cell.customImageView.image = UIImage(data: data!);
                    }
                }
                
            }
            
        } else {
            let rowData = popular[indexPath.row];
            cell.customLabelName.text = rowData.name;
        }
        
        return cell;
    }

    
    func get (completion : @escaping () -> () ) {
        
        let dataStore = self.backendLess!.data.of(gym().ofClass());
        dataStore?.find({ items in
            let gymItems = items as! [gym]
            self.data = gymItems
            print(self.data.count)
            for gym in self.data {
                gym.type = "popular";
                if gym.type == "popular" {
                    self.popular.append(gym);
                } else if gym.type == "off" {
                    self.discount.append(gym);
                }
            }
            
            completion();
            //            self.popularCollectionView.reloadData()
            //            self.discountedCollectionView.reloadData()
        }, error: { fault in
            print(fault?.description)
            completion();
        })
    }
    
    
}
