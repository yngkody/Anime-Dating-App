//
//  CustomTabBarController.swift
//  Anime Dating App
//
//  Created by Teneala Spencer on 6/9/21.
//

import Foundation
import UIKit
class CustomTabBarController: UITabBarController{

    var viewController = UIViewController()

    override func viewDidLoad() {

        let flameController = DatingCardController()
        let flame = UINavigationController(rootViewController: flameController)
        flame.tabBarItem.image = UIImage(systemName: "flame.fill")
        
        let sparkleController = ViewController()
        let sparkle = UINavigationController(rootViewController: sparkleController)
        sparkle.tabBarItem.image = UIImage(systemName: "sparkle")
        
        let messageController = ViewController()
        let message = UINavigationController(rootViewController: messageController)
        message.tabBarItem.image = UIImage(systemName: "message.fill")
        
        let profileController = ViewController()
        let profile = UINavigationController(rootViewController: profileController)
        profile.tabBarItem.image = UIImage(systemName: "person.fill")

        viewControllers = [ flame, sparkle, message, profile]
        
        tabBar.unselectedItemTintColor = .gray

        UITabBar.appearance().tintColor =  #colorLiteral(red: 0.9686274529, green: 0.07844370399, blue: 0.04446444244, alpha: 1)
        
        self.selectedIndex = 0
        
        tabBar.barTintColor = .white
        
    }
    
    
}

