//
//  FeaturedViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDelegate {
    
    
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
   
    

    
    
    
}

