//
//  Dating-Controller-Methods.swift
//  Anime Dating App
//
//  Created by Teneala Spencer on 6/9/21.
//

import Foundation
import UIKit
import Firebase
extension DatingCardController{

    @objc func handleRemoveUser(sender:UIButton) {
        
        let i : Int = (sender.layer.value(forKey: "index")) as! Int
        previousUser = users[i]
        users.remove(at: i)
        
        let image = sender.currentBackgroundImage
        
        switch image {
        case UIImage(systemName: "x.circle"):
            collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.4658900501, blue: 0.4695877058, alpha: 1)
        case UIImage(systemName: "heart.circle"):
            collectionView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case UIImage(systemName: "star.circle"):
            collectionView.backgroundColor = #colorLiteral(red: 0.5246224994, green: 0.6817301461, blue: 1, alpha: 1)
        default:
            print("Enjoy your day!")
        }
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [self] in
            self.collectionView.backgroundColor = #colorLiteral(red: 0.8932988646, green: 0.9063715309, blue: 0.8802261983, alpha: 1)
            self.collectionView.performBatchUpdates({
                                let indexSet = IndexSet(integersIn: 0...0)
                                self.collectionView.reloadSections(indexSet)
                            }, completion: nil)
        }
                
        if users.isEmpty{
            collectionView.addSubview(emptyListLabel)
            emptyListLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            emptyListLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }
}
