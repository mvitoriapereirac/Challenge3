//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        if collectionView == self.popularCollectionView{
            movie = popularMovies[indexPath.item]
        } else if collectionView == self.nowPlayingCollectionView {
            movie = nowPlayingMovies[indexPath.item]
        } else {
            movie = upcomingMovies[indexPath.item]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    
    
    
}
