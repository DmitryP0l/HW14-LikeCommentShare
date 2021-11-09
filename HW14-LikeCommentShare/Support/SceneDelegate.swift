//
//  SceneDelegate.swift
//  HW14-LikeCommentShare
//
//  Created by lion on 4.11.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // UserDefaults
        // хранилище данных, сохранять настройки
        // проверка настроек, юсер залогинен или нет
        //UserDefaults.standard.set(true, forKey: UserDefaults.authKey)
        
        // достаем значение  статуса логина
        // так себе способ
        //guard let _ = (scene as? UIWindowScene) else { return }
        // лучше так
        //UserDefaults.isLoggedIn
        
        
       // настройки по приоритету контроллера
       // let secondViewController = ViewController()
       // window?.rootViewController = secondViewController
       // window?.makeKeyAndVisible()
        
        
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


//
//extension UserDefaults {
//    static let authKey = "isLoggedIn"
//    
//    static var isLoggedIn: Bool {
//        if let value = UserDefaults.standard.value(forKey: UserDefaults.authKey) as? Bool {
//            return value
//        } else {
//            return false
//        }
//    }
//    
//    
//    
//}
