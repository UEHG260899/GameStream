//
//  GamesView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla de juegos")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                print("Primer elemento del JSON")
                print("Titulo del primer videojuego del JSON")
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
