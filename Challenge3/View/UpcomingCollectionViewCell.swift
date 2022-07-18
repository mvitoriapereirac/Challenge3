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
    
    let monthNumToName = ["01-": "Jan ",
                          "02-": "Feb ",
                          "03-": "Mar ",
                          "04-": "Apr ",
                          "05-": "May ",
                          "06-": "Jun ",
                          "07-": "Jul ",
                          "08-": "Aug ",
                          "09-": "Sep ",
                          "10-": "Oct ",
                          "11-": "Nov ",
                          "12-": "Dec "
                          
                          
    ]
    
    static let cellIdentifier = "upcomingCell"
    
    func setup(title: String, image: UIImage, year: String){
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = convertDate(date: String(year.suffix(5)))
    }
    
    func convertDate(date: String) -> String {
        return (monthNumToName[String(date.prefix(3))] ?? "") + String(date.suffix(2))
    }
    
}
