//
//  SearchGameViewModel.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 23/02/22.
//

import Foundation

class SearchGameViewModel: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func searchGame(gameName: String) {
        gameInfo.removeAll()
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    let decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo = decodedData.results
                    }
                }
            }catch {
                print(error)
            }
        }.resume()
    }
}
