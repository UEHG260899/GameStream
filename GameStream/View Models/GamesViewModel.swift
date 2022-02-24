//
//  GameViewModel.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import Foundation

class GamesViewModel: ObservableObject {
    @Published var gamesInfo: [Game] = [Game]()
    typealias GameArray = [Game]
    init() {
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodedData = try JSONDecoder().decode(GameArray.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo = decodedData
                    }
                }
            }catch {
                print(error)
            }
        }.resume()
    }
}
