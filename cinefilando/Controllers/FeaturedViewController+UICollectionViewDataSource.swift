//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  cinefilando
//
//  Created by lrsv on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == upcomingCollectionView {
            return makeUpcomingPlayingCell(indexPath)
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            cell.setup(title:  popularMovies[indexPath.item].title, image: UIImage())
            let movie = popularMovies[indexPath.item]
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image)
            }
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let movie = nowPlayingMovies[indexPath.item]
            let image = UIImage(named: movie.posterPath) ?? UIImage()
            cell.setup(title: movie.title, year: String(movie.releaseDate.prefix(4)), image: image)
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, year: String(movie.releaseDate.prefix(4)), image: image)
            }
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingPlayingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            
            let movie = upcomingMovies[indexPath.item]
            let upcomingImage: UIImage = UIImage(named: movie.posterPath) ?? UIImage()
            let date = upcomingMovies[indexPath.item].releaseDate
            let finalDate = getDate(releaseDate: date)
            cell.setup(title: movie.title, year: finalDate, image: upcomingImage)
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, year: finalDate, image: image)
            }
            return cell
        }
        return UpcomingCollectionViewCell()
    }
    
    fileprivate func getDate(releaseDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: releaseDate)
        let finalDateFormatter = DateFormatter()
        finalDateFormatter.dateFormat = "MMM dd,yyyy"
        let uppercasedDate = finalDateFormatter.string(from: date!).capitalized
        let finalDate = String(uppercasedDate.replacingOccurrences(of: ".", with: "").prefix(6))
        return finalDate
    }
    
    
    
    
}
