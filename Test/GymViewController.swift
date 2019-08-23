import UIKit
import Kingfisher

class GymCollectionViewController: UIViewController  , UICollectionViewDataSource , UICollectionViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var discountedCollectionView: UICollectionView!
    
    var collectionViewflowLayout : UICollectionViewFlowLayout!
    let backendless = Backendless.sharedInstance()!
    
    var gymArray = [gym]();
    var items = [gym]();
    var poluarItems = [gym]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get{
            DispatchQueue.main.async {
                self.setupCollectionView()
            }
        }
    }
    
    private func setupCollectionView () {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        discountedCollectionView.dataSource = self
        discountedCollectionView.delegate = self
        
        popularCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
        discountedCollectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell");
        
        popularCollectionView.reloadData();
        discountedCollectionView.reloadData();
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewItemsSize()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? GymDetailViewController, let item = sender as? item {
//            vc.item = item
//        }
//    }
    
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
    
    func get (completion : @escaping () -> () ) {
        
        let dataStore = self.backendless.data.of(gym().ofClass());
        dataStore?.find({ items in
            let gymItems = items as! [gym]
            self.gymArray = gymItems
            
            for gym in self.gymArray {
                if gym.type == "popular" {
                    self.poluarItems.append(gym);
                } else if gym.type == "off" {
                    self.items.append(gym);
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 10: //popular
            return poluarItems.count
        case 20:
            return items.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell" , for: indexPath) as! CustomCell
        
        var item: gym?
        print(collectionView.tag)
        switch collectionView.tag {
        case 10:
            item = poluarItems[indexPath.row]
        case 20:
            item = items[indexPath.row]
        default:
            return UICollectionViewCell()
        }
        
        guard item != nil else {
            return UICollectionViewCell()
        }
        let gym1 = gymArray[indexPath.row]
        cell.backgroundColor = .red;
        cell.customLabelName.text = gym1.name
        cell.customImageView.image = UIImage (named : item!.image! )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item: gym?
        
        switch collectionView.tag {
        case 10:
            item = poluarItems[indexPath.row]
        case 20:
            item = items[indexPath.row]
        default:
            break
        }
        
        self.performSegue(withIdentifier: "showGym", sender: item)
        print ("didseleted item \(indexPath)")
    }
    
    
}
