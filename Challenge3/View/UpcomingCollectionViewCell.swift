//
//  upcomingCollectionViewCell.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    static let cellIdentifier = "upcomingCell"
    
    func setup(title: String, image: UIImage, year: String){
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = year
    }

}
