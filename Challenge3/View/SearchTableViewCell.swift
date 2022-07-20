//
//  SearchTableViewCell.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 19/07/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var imageMovie: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(image: UIImage, year: String, title: String) {
        imageMovie.image = image
        dateLabel.text = year
        titleLabel.text = title
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    }

    
    

