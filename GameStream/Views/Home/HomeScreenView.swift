//
//  HomeScreenView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 19/02/22.
//

import SwiftUI
import AVKit

struct HomeScreenView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Image("applogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                ScrollView(showsIndicators: false) {
                    HomeModule()
                }
                
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct HomeModule: View {
    @State var searchString: String = ""
    @State var isGameEmpty: Bool = false
    @State var isPlayerActive = false
    @ObservedObject var searchGameViewModel = SearchGameViewModel()
    @State var isGameViewActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var rate: String = ""
    @State var publication: String = ""
    @State var description: String = ""
    @State var tags: [String] = [String]()
    @State var imgUrls: [String] = [String]()
    @State var studio: String = ""
    
    var body: some View {
        HStack {
            Button {
                search(searchQuery: searchString)
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchString.isEmpty ? .yellow : Color("DarkCyanColor"))
            }.alert(isPresented: $isGameEmpty) {
                Alert(title: Text("Error"), message: Text("No se encontrö el juego"), dismissButton: .default(Text("Aceptar")))
            }

            ZStack(alignment: .leading) {
                if searchString.isEmpty {
                    Text("Buscar un video")
                        .foregroundColor(Color("SearchForegroundColor"))
                }
                
                TextField("", text: $searchString)
                    .foregroundColor(.white)
            }
            
        }.padding([.top, .leading, .bottom], 11)
            .background(Color("TabBarColor"))
            .clipShape(Capsule())
        Spacer()
        
        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            ZStack {
                Button {
                    url = imgUrls.first!
                    isPlayerActive = true
                } label: {
                    VStack(spacing: 0) {
                        Image("game.witcher")
                            .resizable()
                            .scaledToFill()
                        Text("The witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("TabBarColor"))
                            .foregroundColor(.white)
                    }
                }
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)

            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            CategoriesModule()
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        url = imgUrls.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.witcher")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }
                    
                    Button {
                        url = imgUrls.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.spiderman")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }
                    
                    Button {
                        url = imgUrls.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.lastofus.two")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }

                }
            }
        }
        
        NavigationLink(isActive: $isGameViewActive) {
            GameView(url: url, title: title, rate: rate, publication: publication, description: description, tags: tags, imgUrls: imgUrls, studio: studio)
        } label: {
            EmptyView()
        }
        

    }
    
    func search(searchQuery: String) {
        searchGameViewModel.searchGame(gameName: searchQuery)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            if searchGameViewModel.gameInfo.count == 0 {
                isGameEmpty = true
            }else {
                url = searchGameViewModel.gameInfo.first!.videosUrls.mobile
                title = searchGameViewModel.gameInfo.first!.title
                studio = searchGameViewModel.gameInfo.first!.studio
                rate = searchGameViewModel.gameInfo.first!.contentRaiting
                publication = searchGameViewModel.gameInfo.first!.publicationYear
                description = searchGameViewModel.gameInfo.first!.description
                tags = searchGameViewModel.gameInfo.first!.tags
                imgUrls = searchGameViewModel.gameInfo.first!.galleryImages
                isGameViewActive = true
            }
        }
    }
}

struct CategoriesModule: View {
    var body: some View {
        Text("CATEGORIAS SUGERIDAS PARA TI")
            .font(.title3)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    print("H")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("TabBarColor"))
                            .frame(width: 160, height: 90)
                        Image("img.fps")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
                
                Button {
                    print("H")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("TabBarColor"))
                            .frame(width: 160, height: 90)
                        Image("img.rpg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }
                
                Button {
                    print("H")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("TabBarColor"))
                            .frame(width: 160, height: 90)
                        Image("img.open.world")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    }
                }

            }

        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

