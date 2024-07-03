
import UIKit

class LikedViewController: UIViewController {
    
    @IBOutlet weak var likedCollectionView: UICollectionView!
    
    var dataSource = [Book]()
    private let authManager = LikedBooksManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard 
            let tabBarController = self.tabBarController as? TabBarController,
            let user = tabBarController.user else { return }
        
        likedCollectionView.dataSource = self
        dataSource = authManager.getLikedBooks(user: user)
    }
    
}

extension LikedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikedCollectionViewCell", for: indexPath) as? LikedCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
    
    
}
