import UIKit

class DetailedInfoBookViewController: UIViewController {

    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var toLikedButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    private let likedBooks = LikedBooksManager.shared
    var user: User?
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    func configure() {
        authorLabel.text = book?.author
        nameLabel.text = book?.name
        coverImageView.image = book?.image
        summaryLabel.text = book?.summary
        if let user = user, likedBooks.isBookLiked(user: user, book: book!) {
            toLikedButton.setTitle("В избранном", for: .normal)
        } else {
            toLikedButton.setTitle("Добавить в избранное", for: .normal)
        }
    }
    
    @IBAction func toLikedButtonTapped(_ sender: Any) {
        guard let user = user, let book = book else { return }
        if likedBooks.isBookLiked(user: user, book: book) {
            likedBooks.removeLikedBook(user: user, book: book)
            toLikedButton.setTitle("Добавить в избранное", for: .normal)
        } else {
            likedBooks.addLikedBook(user: user, book: book)
            toLikedButton.setTitle("В избранном", for: .normal)
        }
        NotificationCenter.default.post(name: .likedBooksUpdated, object: nil)
    }
}
