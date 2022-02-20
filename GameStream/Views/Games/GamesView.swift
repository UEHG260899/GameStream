//
//  GamesView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var gameViewModel = GameViewModel()
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var rate: String = ""
    @State var tags: [String] = [String]()
    @State var publication: String = ""
    @State var description: String = ""
    @State var imgUrls: [String] = [String]()
    
    
    let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {
                    LazyVGrid(columns: gridShape, spacing: 8) {
                        ForEach(gameViewModel.gamesInfo, id: \.self) { game in
                            Button {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                rate = game.contentRaiting
                                tags = game.tags
                                imgUrls = game.galleryImages
                                description = game.description
                                publication = game.publicationYear
                                
                                print("Pulse el juego")
                            } label: {
                                KFImage(URL(string: game.galleryImages.first!)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            }

                        }
                        
                    }
                    
                }
                
            }.padding(.horizontal, 6)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                // Ciclo de vida de la vista
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
