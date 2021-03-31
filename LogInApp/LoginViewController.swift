//
//  LoginViewController.swift
//  LogInApp
//
//  Created by Roman Kozlov on 31.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let users = [
        "user" : "1234",
        "admin" : "password"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonAction() {
        guard let userName = userNameTextField.text else { return }
        guard let userPassword = passwordTextField.text else { return }
        
        checkingUsers(userName, userPassword)
    }
    
    @IBAction func forgetNameButton() {
        showAlert(with: "Ooops", and: "Your name is user")
    }
    
    @IBAction func forgetPasswordButton() {
        showAlert(with: "Ooops", and: "Your password is 1234")
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    func checkingUsers(_ userName: String, _ userPassword: String) {
        if let password = users[userName] {
            if userPassword == password {
                performSegue(withIdentifier: "welcomeId", sender: nil)
            } else {
                showAlert(with: "Ooooops", and: "Wrong password!")
            }
        } else {
            showAlert(with: "Ooooops", and: "No such login!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
