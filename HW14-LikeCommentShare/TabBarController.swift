//
//  TabBarController.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 9.11.21.
//

import UIKit
final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbarVC = UITabBarController()
        tabbarVC.tabBar.backgroundColor = .green
        let vc1 = HomeWorkVC()
        let vc2 = UserViewController()

        vc1.title = "HOME"
        vc2.title = "PROFILE"

        self.setViewControllers([vc1, vc2], animated: false)
         
//        guard let items = tabbarVC.tabBar.items else{
//            return
//        }
//        let images = ["house", "star"]
//        let image = ["star.fill","star.fill"]
//        for i in 0..<items.count {
//            items[i].selectedImage = UIImage(systemName: image[i])
//            items[i].image = UIImage(systemName: images[i])
//        }
        present(tabbarVC, animated: true)
        
    }
        
      }
    


