
import UIKit

class LikedViewController: UIViewController {
    
    @IBOutlet weak var likedCollectionView: UICollectionView!
    var user: User?
    var dataSource: UICollectionViewDiffableDataSource<Int, Book>!
    private let likedBooksManager = LikedBooksManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        guard
            let tabBarController = self.tabBarController as? TabBarController,
            let user = tabBarController.user else { return }
        self.user = user
        updateDataSource()
        NotificationCenter.default.addObserver(self, selector: #selector(updateDataSource), name: .likedBooksUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .likedBooksUpdated, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataSource()
    }
    
    @objc func updateDataSource() {
        guard let user = user else { return }
        let likedBooks = likedBooksManager.getLikedBooks(user: user)
        var snapshot = NSDiffableDataSourceSnapshot<Int, Book>()
        snapshot.appendSections([0])
        snapshot.appendItems(likedBooks)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionView() {
        likedCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        dataSource = UICollectionViewDiffableDataSource<Int, Book>(collectionView: likedCollectionView) { collectionView, indexPath, book in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikedCollectionViewCell", for: indexPath) as? LikedCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            cell.configure(with: book)
            return cell
        }
        likedCollectionView.dataSource = dataSource
        likedCollectionView.delegate = self
    }
}

extension LikedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 358, height: 159)
    }
}

extension Notification.Name {
    static let likedBooksUpdated = Notification.Name("likedBooksUpdated")
}
