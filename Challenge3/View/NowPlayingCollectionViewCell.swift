//
//  NowPlayingCollectionViewCell.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    static let cellIdentifier = "nowPlayingCell"
    
    func setup(title: String, image: UIImage, year: String) {
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = year
    }

}
