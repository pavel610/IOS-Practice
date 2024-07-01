//
//  InfoViewController.swift
//  Authentication
//
//  Created by Павел Калинин on 01.07.2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var additionalText: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureInfoViewContoller()
    }
    
    func configureInfoViewContoller(){
        avatar.image = user?.avatar
        name.text = user?.fullName
        dateOfBirth.text = user?.birthDate
        mail.text = user?.contactInfo
        additionalText.text = user?.bio
    }
    
    @IBAction func sigOut(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
