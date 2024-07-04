//
//  DetailedInfoBookViewController.swift
//  Authentication
//
//  Created by Павел Калинин on 02.07.2024.
//

import UIKit

class DetailedInfoBookViewController: UIViewController {

    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure(with book: Book?) {
        authorLabel.text = book?.author
        nameLabel.text = book?.name
        coverImageView.image = book?.image
        summaryLabel.text = book?.summary
    }
    

    @IBAction func ToLikedButtonTapped(_ sender: Any) {
        
    }
    

}
