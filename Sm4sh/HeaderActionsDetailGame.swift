//
//  HeaderDetailGame.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/24/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class HeaderActionsDetailGame: UIStackView {

    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 16).isActive = true
        settingsButton.setImage(#imageLiteral(resourceName: "back_button_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "share_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        [settingsButton, UIView(),  messageButton].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        
        isLayoutMarginsRelativeArrangement = true
        
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
