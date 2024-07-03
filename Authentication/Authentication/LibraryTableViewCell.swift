
import UIKit

class LibraryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        nameLabel.text = nil
        authorLabel.text = nil
    }
    
    func configure(with book: Book, user: User?) {
        coverImageView.image = book.image
        nameLabel.text = book.name
        authorLabel.text = book.author
    }
    
}
