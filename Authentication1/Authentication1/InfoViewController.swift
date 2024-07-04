import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var additionalTextLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabBarController = self.tabBarController as? TabBarController {
            let user = tabBarController.user
            configure(with: user)
        }
    }
    
    
    func configure(with user: User?) {
        avatarImageView.image = user?.avatar
        nameLabel.text = user?.fullName
        dateOfBirthLabel.text = user?.birthDate
        mailLabel.text = user?.contactInfo
        additionalTextLabel.text = user?.bio
    }
    
    @IBAction func signOutButtonTappedd(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
