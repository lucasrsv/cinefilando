//
//  FeaturedViewControlleroller+UICollectionViewDelegate.swift
//  cinefilando
//
//  Created by lrsv on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == self.popularCollectionView {
            print("tocou numa cell da popular")
            movie = popularMovies[indexPath.item]
        } else if collectionView == self.nowPlayingCollectionView {
            print("tocou numa cell da now playing")
            movie = nowPlayingMovies[indexPath.item]
        } else {
            movie = nowPlayingMovies[indexPath.item]
            print("tocou na outra")
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
