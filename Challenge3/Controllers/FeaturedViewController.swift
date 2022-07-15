//
//  FeaturedViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var popularMovies: [Movie] = [] //Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }

    }

    
    
   
}

