//
//  SwipingController.swift
//  Sm4sh
//
//  Created by JC Navarro on 2/22/19.
//  Copyright © 2019 JC Navarro. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        SwipeItem(imageName: "link", description: "Access ourextented Catalog", buttonType: 0),
        SwipeItem(imageName: "charizar", description: "Know the titleis worth gaming", buttonType: 0),
        SwipeItem(imageName: "figth", description: "Real-time updates ", buttonType: 0)
    ]
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        cell.nextButton.addTarget(self, action: #selector(self.handleChangeStep), for: .touchUpInside)
        return cell
    }
    
    @objc func handleChangeStep() -> Void {
        self.present(DetailGameViewController(), animated: true, completion: nil)
        print("next item")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
