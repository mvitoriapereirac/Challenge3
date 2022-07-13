//
//  DetailsViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie)
        self.title = movie?.title
        // Do any additional setup after loading the view.
    }
    

  

}
