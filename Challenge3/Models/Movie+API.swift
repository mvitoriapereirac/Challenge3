//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/")!
    
    
    //MARK: -  Download de APIs
    fileprivate static func downloadAPI(path: String) async -> [Movie] {
        
        var components = Movie.urlComponents
        components.path = path
        
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error.localizedDescription)
            return []
            
        }
    }
    
    //MARK: -  Download de Populares
    static func popularMoviesAPI() async -> [Movie] {
        let path: String = "/3/movie/popular"
        return await downloadAPI(path: path)
        
        
    }
    
    //MARK: - Download de Now Playing
    static func nowPlayingAPI() async -> [Movie] {
        let path: String = "/3/movie/now_playing"
        return await downloadAPI(path: path)
        
    }
    
    //MARK: - Download de Upcoming
    static func upcomingAPI() async -> [Movie] {
        let path: String = "/3/movie/upcoming"
        return await downloadAPI(path: path)
        
    }
    //MARK: - Download de Search
    static func searchAPI(search: String) async -> [Movie] {

                var components = Movie.urlComponents
                components.path = "/3/search/movie"
                components.queryItems = [
                    URLQueryItem(name : "api_key", value : Movie.apiKey),
                    URLQueryItem(name : "query", value : search)
                ]
                
                let session = URLSession.shared
                
                do {
                    let (data, _) = try await session.data(from: components.url!)
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let movieResult = try decoder.decode(MoviesResponse.self, from: data)
                    print("\(movieResult.results.count) filmes no MovieResponse")
                    return movieResult.results
                    
                
                } catch {
                    //print(error)
                    print("Deu ruim no searchMovies")
                }
                // se der erro no do, retorna uma lista vazia
                return []
    }
    
    
    //MARK: - Trending day download
    
    static func trendingDayMoviesAPI() async -> [Movie] {
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/day"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error)
        }
        
        return []
    }
    
    //MARK: - Trending week download
    
    static func trendingWeekMoviesAPI() async -> [Movie] {
        var components = Movie.urlComponents
        components.path = "/3/trending/movie/week"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movieResult = try decoder.decode(MoviesResponse.self, from: data)
            
            return movieResult.results
            
        } catch {
            print(error)
        }
        
        return []
    }
    //MARK: - Download de Imagens
    static func downloadImageData(withPath: String) async -> Data {
        let urlString = "https://image.tmdb.org/t/p/w780\(withPath)"
        let url: URL = URL(string: urlString)!
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: url)
            return data
        } catch {
            print(error.localizedDescription)
        }
        
        
        return Data()
    }
    
    // MARK: - Recuperando a chave da API de um arquivo
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
}

