//
//  Webservşces.swift
//  Bundle
//
//  Created by İbrahim Ay on 20.08.2023.
//

import Foundation

final class Webservices {
    static let shared = Webservices()
    
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=55bf61b34f6d4fb182bfdaf93a819d73")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Articles], Error>) -> Void ) {
        guard let url = Constants.topHeadLinesURL else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(NewsModel.self, from: data)
                    print("Articles: \(response.articles.count)")
                    completion(.success(response.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
