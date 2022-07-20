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
    var nowPlayingMovies: [Movie] = []  //Movie.nowPlayingMovies()
    var upcomingMovies: [Movie] = [] //Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        sleep(2)
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
        
        Task {
            nowPlayingMovies = await Movie.nowPlayingAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            upcomingMovies = await Movie.upcomingAPI()
            self.upcomingCollectionView.reloadData()
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

