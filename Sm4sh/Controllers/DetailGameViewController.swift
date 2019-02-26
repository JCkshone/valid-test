//
//  DetailGameViewController.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/23/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class DetailGameViewController: UIViewController {
    
    let textViewSku: UITextView = {
        let textView = UITextView()
        textView.text = "Captain Falcon is a starting veteran in Super Smash Bros. for Nintendo 3DS and Wii U, representing the F-Zero universe. Captain Falcon was confirmed on July 14, 2014 alongside Lucina and Robin, the 16-year anniversary of the release of F-Zero X.Captain Falcon currently ranks 19th on the tier list, which is a massive improvement over Brawl. Captain Falcon possesses an outstanding combo game, incredible mobility, and several powerful finishers. However, his weaknesses lie in his poor recovery and short reach of attacks."
        textView.font = UIFont.boldSystemFont(ofSize: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .none
        textView.textColor = .white
        textView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        return textView
    }()
    
    
    let topStackView = HeaderActionsDetailGame()
    let headerDetailGame = HeaderText()
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupGradientLayer()
        setupLayout()
    
    }
    @objc func handleButton() -> Void {
        
    }
    
    func setupLayout() -> Void {
        
        let overallStackView = UIStackView(arrangedSubviews: [
            topStackView,
            headerDetailGame,
            textViewSku
            ])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 10, left: 16, bottom: 0, right: 16)
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
