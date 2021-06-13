//
//  Dating-Card-Controller.swift
//  Anime Dating
//
//  Created by Teneala Spencer on 6/9/21.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import Firebase
final class DatingCardController:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    public static let shared = DatingCardController()
    
    var previousUser = User()

    let reuseIdentifier: String = "cellID"

    var users = [User]()
    
    var collectionView: UICollectionView!

    let defaultPFP = "https://firebasestorage.googleapis.com/v0/b/anime-dating-app-sample.appspot.com/o/tumblr_c843e1050f9f2264a84c8240bd4a3fc5_3cc42568_1280.jpg?alt=media&token=0d443e5f-83e8-4cd5-a3a9-a46377131b2e"
    
    lazy var emptyListLabel: UILabel = {
        let tv = UILabel()
        tv.text = "Match line empty..."
        tv.font = UIFont(name:"HelveticaNeue-BoldItalic",size:23)
        tv.textColor = UIColor.gray
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    func fetchUser() -> [User]{
        let ref = Database.database().reference()
        ref.observe( .childAdded, with: { snapshot in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                let user = User()
                user.setValuesForKeys(dictionary)
                self.users.append(user)
                DispatchQueue.main.async {
                   self.collectionView?.reloadData()
               }
            }
        })
       
        return users
    }
    
    override func viewDidLoad() {
        users = fetchUser()
        navigationController?.navigationBar.isHidden = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height - view.frame.height / 8)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(DatingCardCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.8932988646, green: 0.9063715309, blue: 0.8802261983, alpha: 1)
        collectionView.isScrollEnabled = false
        view.addSubview(collectionView)

    }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DatingCardCell
        let user = users[indexPath.row]
        cell.userLabel.text = user.username
        cell.locationLabel.text = user.location
        cell.descriptionLabel.text = user.pfDescription
        cell.profileImageView.loadImagesUsingCacheWithUrlString(urlString: user.profilePictureURL ?? defaultPFP)
        cell.dislikeButton.layer.setValue(indexPath.row, forKey: "index")
        cell.heartButton.layer.setValue(indexPath.row, forKey: "index")
        cell.superLikeButton.layer.setValue(indexPath.row, forKey: "index")
        cell.superLikeButton.addTarget(self, action: #selector(handleRemoveUser), for: .touchUpInside)
        cell.dislikeButton.addTarget(self, action: #selector(handleRemoveUser), for: .touchUpInside)
        cell.heartButton.addTarget(self, action: #selector(handleRemoveUser), for: .touchUpInside)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DatingCardCell
        cell.profileImageView.image = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 5
    }

}
