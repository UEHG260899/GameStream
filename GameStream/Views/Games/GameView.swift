//
//  GameView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import SwiftUI

struct GameView: View {
    var url: String
    var title: String
    var rate: String
    var publication: String
    var description: String
    var tags: [String]
    var imgUrls: [String]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "", title: "", rate: "", publication: "", description: "", tags: [""], imgUrls: [""])
    }
}
