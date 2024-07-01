//
//  ViewController.swift
//  Authentication
//
//  Created by Павел Калинин on 01.07.2024.
//

import UIKit

class AuthViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goInside" {
            if let profileVC = segue.destination as? InfoViewController, let user = sender as? User {
                profileVC.user = user
            }
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
                
        if let user = AuthManager.shared.LogInUser(login: login, pass: password){
            loginTextField.text = ""
            passwordTextField.text = ""
            performSegue(withIdentifier: "goInside", sender: user)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    

}

