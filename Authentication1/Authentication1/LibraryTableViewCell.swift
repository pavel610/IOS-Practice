import UIKit

class LibraryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    
    private var book: Book?
    private var user: User?
    private let likedBooksManager = LikedBooksManager.shared
    
    override func awakeFromNib() {
            super.awakeFromNib()
            NotificationCenter.default.addObserver(self, selector: #selector(handleLikedBooksUpdated), name: .likedBooksUpdated, object: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        nameLabel.text = nil
        authorLabel.text = nil
        heartButton.removeTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    func configure(with book: Book, user: User?) {
        self.user = user
        self.book = book
        coverImageView.image = book.image
        nameLabel.text = book.name
        authorLabel.text = book.author
        configureButton(book: book, user: user)
    }
    
    func configureButton(book: Book, user: User?) {
        if let user = user, likedBooksManager.isBookLiked(user: user, book: book) {
            heartButton.tintColor = .red
        } else {
            heartButton.tintColor = .gray
        }
    }
    
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        guard let book = book, let user = user else { return }
        if likedBooksManager.isBookLiked(user: user, book: book) {
            heartButton.tintColor = .gray
            likedBooksManager.removeLikedBook(user: user, book: book)
        } else {
            likedBooksManager.addLikedBook(user: user, book: book)
            heartButton.tintColor = .red
        }
        
        NotificationCenter.default.post(name: .likedBooksUpdated, object: nil)
    }
    
    @objc func handleLikedBooksUpdated() {
            guard let book = book, let user = user else { return }
            configureButton(book: book, user: user)
    }
}
