//
//  HeaderText.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/24/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class HeaderText: UIStackView {

    let textInfo = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        let attributedString = NSMutableAttributedString(string: "SKU: 43564234", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .heavy), .foregroundColor: UIColor(white: 1, alpha: 0.4)])
        
        attributedString.append(NSAttributedString(string: "\n" + "CAPTAIN FALCON", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .bold), .foregroundColor: UIColor(white: 1, alpha: 1)]))
        attributedString.append(NSAttributedString(string: "\n" + "F-Zero", attributes: [.font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor(white: 1, alpha: 1)]))
        attributedString.append(NSAttributedString(string: "· " + "Human", attributes: [.font: UIFont.systemFont(ofSize: 13, weight: .bold), .foregroundColor: UIColor(white: 1, alpha: 1)]))
        attributedString.append(NSAttributedString(string: "\n\n" + "4,325,292 downloads", attributes: [.font: UIFont.systemFont(ofSize: 10, weight: .bold), .foregroundColor: UIColor(white: 1, alpha: 1)]))
        
        textInfo.attributedText = attributedString
        textInfo.translatesAutoresizingMaskIntoConstraints = false
        textInfo.isEditable = false
        textInfo.isScrollEnabled = false
        textInfo.backgroundColor = .none
        textInfo.heightAnchor.constraint(equalToConstant: 170).isActive = true
        //textInfo.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        func resizeImage(image: UIImage!, newWidth: CGFloat) -> UIImage? {
            
            let scale = newWidth / image.size.width
            let newHeight = image.size.height * scale
            UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
            image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
        
        let imageView: UIImageView = {
            
            let imageView = UIImageView(); // set as you want
            let image = UIImage(named: "charizar");
            imageView.widthAnchor.constraint(equalToConstant: 120)
            //image?.stretchableImage(withLeftCapWidth: 10, topCapHeight: 30)
            imageView.image = resizeImage(image:image, newWidth: 100);
            return imageView;
        }()

        
        [textInfo, UITextView(), imageView, UIImageView()].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        
        isLayoutMarginsRelativeArrangement = true
        
        layoutMargins = .init(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
