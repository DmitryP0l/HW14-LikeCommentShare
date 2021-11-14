//
//  UserViewController.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 9.11.21.
//

import UIKit

class UserViewController: UIViewController {

    
    @IBOutlet weak var imageViewProfile: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userAgeProfile: UILabel!
    
    @IBOutlet weak var userLocationProfile: UILabel!
    
    @IBAction func logoutProfileButton(_ sender: UIButton) {
        UserDefaults().logout()
        print()
    }
    
    
    // 3
    weak var delegate: TitleProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //4
        delegate = self
        
        //5
        delegate?.changeTitle()
        if let userName = UserDefaults.standard.value(forKey: "userName") as? String {
            userNameLabel.text = userName
        }
    }
}


// 2
extension UserViewController: TitleProtocol {
    func changeTitle() {
        if let userName = UserDefaults.standard.value(forKey: "userName") {
            showAlert(title: "Привет", message: "Давно ен виделись \(userName)")
        }
    }
}


// 1

protocol TitleProtocol: AnyObject {
    func changeTitle()
}





