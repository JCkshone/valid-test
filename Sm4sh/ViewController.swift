//
//  ViewController.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/22/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        /*button.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true*/
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleChangeStep), for: .touchUpInside)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientLayer()
        setupLayout()
        setupGradientLayerToImageView()
        
    }
    
   @objc func handleChangeStep() -> Void {
        print("next item")
    }
    
    func setupLayout() -> Void {
        
        view.addSubview(overallStackView)
        overallStackView.axis = .vertical
        overallStackView.spacing = 8
        overallStackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50))
        overallStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func setupGradientLayerToImageView() {
        // how we can draw a gradient with Swift
        
        //let topColor = #colorLiteral(red: 0.8980392157, green: 0.3215686275, blue: 0.2862745098, alpha: 1)
        //let bottomColor  = #colorLiteral(red: 0.1647058824, green: 0.3215686275, blue: 0.7450980392, alpha: 1)
        
        //finallyGradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        //finallyGradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        //finallyGradientLayer.locations = [0.5,4]
        //view.layer.addSublayer(finallyGradientLayer)
        //finallyGradientLayer.frame = view.bounds
        
        //finallyGradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        //finallyGradientLayer.locations = [0.5, 1.1]
        // self.frame is actually zero frame
        
        //view.layer.addSublayer(finallyGradientLayer)
    }
    
    fileprivate func setupGradientLayer() -> Void {
        let topColor = #colorLiteral(red: 0.8980392157, green: 0.3215686275, blue: 0.2862745098, alpha: 1)
        let bottomColor  = #colorLiteral(red: 0.1647058824, green: 0.3215686275, blue: 0.7450980392, alpha: 1)
        
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0,1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
    }


}

