//
//  LoginViewController.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 9.11.21.
//

import UIKit

class LoginViewController: UIViewController {

    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func enterButton(_ sender: UIButton) {
        if let text = textField.text {
            if !text.isEmpty {
                let userName = userDefaults.value(forKey: "userName") as? String
                if userName == nil {
                    login(for: text)
                } else {
                    if text == userName {
                        login(for: text)
                    } else {
                        showAlert(title: "Введите правильное имя юзера", message: "Такого пользователя тут нет")
                    }
                }
            } else {
                showAlert(title: "Поле не должно бытьб пустым", message: "Пожалйста заполните поле с именем пользователя")
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    func login(for userName: String) {
        self.userDefaults.set(userName, forKey: "userName")
        let tabbar = TabBarController()
        tabbar.modalPresentationStyle = .fullScreen
        present(tabbar, animated: true) {
            self.userDefaults.set(true, forKey: "isLoggedIn")
        }
    }
    
}


extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "NO", style: .cancel) { action in
            self.showAlert(title: "ТЫ что тупой?", message: "Имя мать твою")
        }
        alert.addActions(actions: [okAction, noAction])
        present(alert, animated: true, completion: nil)
    }
}

extension UIAlertController {
    func addActions(actions: [UIAlertAction]) {
        for action in actions {
            self.addAction(action)
        }
    }
}
