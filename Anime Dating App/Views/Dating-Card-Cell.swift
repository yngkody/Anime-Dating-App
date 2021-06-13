import UIKit
import AVFoundation

//import Firebase

class DatingCardCell: UICollectionViewCell , UITextViewDelegate{

    var indxPath = IndexPath()
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        label.font = UIFont(name:"HelveticaNeue-BoldItalic",size:23)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.text = "Location"
        label.font = UIFont(name:"HelveticaNeue-Medium",size:17)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.font = UIFont(name:"HelveticaNeue-Regular",size:17)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "personal.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.layer.borderWidth = 0.1
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
        
    }()
    
    lazy var locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    lazy var refreshButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gobackward"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    lazy var dislikeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    lazy var superLikeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "star.circle"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart.circle"), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    lazy var boltButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "bolt.circle"), for: .normal)
        button.tintColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()

    override func prepareForReuse() {
        profileImageView.image = nil
    }
    override init(frame: CGRect){
        super.init(frame: frame)

        addSubview(profileImageView)
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive  = true
        profileImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive  = true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive  = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive  = true
                
        profileImageView.addSubview(superLikeButton)
        superLikeButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        superLikeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        superLikeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        superLikeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        profileImageView.addSubview(heartButton)
        heartButton.leftAnchor.constraint(equalTo: superLikeButton.rightAnchor, constant: 25).isActive = true
        heartButton.bottomAnchor.constraint(equalTo: superLikeButton.bottomAnchor, constant: -10).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        profileImageView.addSubview(boltButton)
        boltButton.leftAnchor.constraint(equalTo: heartButton.rightAnchor, constant: 25).isActive = true
        boltButton.bottomAnchor.constraint(equalTo: superLikeButton.bottomAnchor, constant: -10).isActive = true
        boltButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        boltButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        profileImageView.addSubview(dislikeButton)
        dislikeButton.rightAnchor.constraint(equalTo: superLikeButton.leftAnchor, constant: -25).isActive = true
        dislikeButton.bottomAnchor.constraint(equalTo: superLikeButton.bottomAnchor, constant: -10).isActive = true
        dislikeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        dislikeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        profileImageView.addSubview(refreshButton)
        refreshButton.rightAnchor.constraint(equalTo: dislikeButton.leftAnchor, constant: -25).isActive = true
        refreshButton.bottomAnchor.constraint(equalTo: superLikeButton.bottomAnchor, constant: -10).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        profileImageView.addSubview(descriptionLabel)
        descriptionLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 8).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: superLikeButton.topAnchor, constant: -10).isActive = true
        
        profileImageView.addSubview(userLabel)
        userLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor, constant: 8).isActive = true
        userLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5).isActive = true
            
        profileImageView.addSubview(locationIconImageView)
        locationIconImageView.leftAnchor.constraint(equalTo: userLabel.rightAnchor, constant: 8).isActive = true
        locationIconImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5).isActive = true
        locationIconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationIconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        profileImageView.addSubview(locationLabel)
        locationLabel.leftAnchor.constraint(equalTo: locationIconImageView.rightAnchor, constant: 8).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5).isActive = true

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
    


