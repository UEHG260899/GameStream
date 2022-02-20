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
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        HStack {
            Button {
                search()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(searchString.isEmpty ? .yellow : Color("DarkCyanColor"))
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
                    url = urlVideos.first!
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
                        url = urlVideos.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.witcher")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }
                    
                    Button {
                        url = urlVideos.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.spiderman")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }
                    
                    Button {
                        url = urlVideos.first!
                        isPlayerActive = true
                    } label: {
                        Image("game.lastofus.two")
                            .resizable()
                            .frame(width: 240, height: 145)
                    }

                }
            }
        }
        
        NavigationLink(isActive: $isPlayerActive) {
            VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300)
        } label: {
            EmptyView()
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

func search() {
    
}
