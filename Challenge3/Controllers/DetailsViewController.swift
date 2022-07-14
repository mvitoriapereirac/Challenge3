//
//  DetailsViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie)
        // Do any additional setup after loading the view.
        guard let movie = movie else {
            return
        }
        backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        self.title = movie.title
        
    }
    

  

}
