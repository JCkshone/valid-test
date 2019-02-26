//
//  PageCell.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/23/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    var page: SwipeItem? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            imageView.image = UIImage(named: unwrappedPage.imageName)
            descriptionTextView.text = unwrappedPage.description
            descriptionTextView.textAlignment = .center
        }
    }
    
    let imageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "link"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let descriptionTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Access ourextented Catalog"
        textView.font = UIFont.boldSystemFont(ofSize: 32)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = .white
        return textView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        button.backgroundColor = .none
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 0.8588, green: 0.1882, blue: 0.4118, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    let finallyGradientLayer = CAGradientLayer()
    
    lazy var overallStackView: UIStackView = UIStackView(arrangedSubviews: [
        imageView,
        descriptionTextView,
        nextButton
        ])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
        setupLayout()
    }
    
    func setupLayout() -> Void {
        
        addSubview(overallStackView)
        overallStackView.axis = .vertical
        overallStackView.spacing = 8
        overallStackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50))
        overallStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupGradientLayer() -> Void {
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.8980392157, green: 0.3215686275, blue: 0.2862745098, alpha: 1)
        let bottomColor  = #colorLiteral(red: 0.1647058824, green: 0.3215686275, blue: 0.7450980392, alpha: 1)
        gradientLayer.frame.size = frame.size
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0,1]
        backgroundView = collectionViewBackgroundView
        backgroundView?.layer.addSublayer(gradientLayer)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
