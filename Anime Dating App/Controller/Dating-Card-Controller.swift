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
    
    let reuseIdentifier: String = "cellID"

    var users = [User]()
    
    var collectionView: UICollectionView!

    
    lazy var emptyListLabel: UILabel = {
        let tv = UILabel()
        tv.text = "Match line empty..."
        tv.font = UIFont(name:"HelveticaNeue-BoldItalic",size:23)
        tv.textColor = UIColor.gray
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    
    override func viewDidLoad() {
        
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
