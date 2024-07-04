import UIKit

class AuthViewController: UIViewController {

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    private let authManager = AuthManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "goInside",
            let tabBarController = segue.destination as? TabBarController, let user = sender as? User else { return }
        tabBarController.user = user
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        if let user = authManager.LogInUser(login: login, pass: password) {
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

