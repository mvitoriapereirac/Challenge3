//
//  SearchMoviesViewController.swift
//  Challenge3
//
//  Created by mvitoriapereirac on 19/07/22.
//

import UIKit

class SearchMoviesViewController: UIViewController, UISearchResultsUpdating {
    @IBOutlet var resultsSearchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsSearchTableView.dataSource = self
        resultsSearchTableView.delegate = self
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Busca por título"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func amplifyPoster(_ sender: Any) {
        performSegue(withIdentifier: "amplifyImage", sender: amplifyPoster(_:))
    }
    var searchController = UISearchController()
    var searchMovies: [Movie] = []
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else {
            return
        }
        
        Task {
            print("passou na Task do search")
            self.searchMovies = await Movie.searchAPI(search: title)
            
            resultsSearchTableView.reloadData()
            print(searchMovies)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SearchMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = searchMovies[indexPath.item]
        
        performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}

extension SearchMoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(searchMovies.count)
        print("contou quantos movies")
        return searchMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if let cell = resultsSearchTableView?.dequeueReusableCell(withIdentifier: "resultsSearch", for: indexPath) as? SearchTableViewCell {
            print("entrou no if let da config da cell")
            let title = searchMovies[indexPath.item].title
            let year = String(searchMovies[indexPath.item].releaseDate.prefix(4))
            let image = UIImage()
           
            cell.setup(image: image, year: year, title: title)
            let movies = searchMovies[indexPath.item]
            
            Task {
                print("passou aq na task de imagens da tableview")
                let imageData = await Movie.downloadImageData(withPath: movies.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                cell.setup(image: imagem, year: year, title: title)
                resultsSearchTableView.reloadData()
                print("o num de cels é \(searchMovies.count)")
            }
            return cell
        }
        print("nao entrou no if let da config da cell")

        return UITableViewCell()
        
        
    }
}
