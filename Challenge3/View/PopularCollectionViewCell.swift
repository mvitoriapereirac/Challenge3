//
//  PopularCollectionViewCell.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    static let cellIdentifier = "popularCell"
    
    func setup (title: String, image: UIImage) {
        titleLabel.text = title
        self.image.image = image
    }
}
