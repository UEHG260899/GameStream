//
//  GameView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 20/02/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    var url: String
    var title: String
    var rate: String
    var publication: String
    var description: String
    var tags: [String]
    var imgUrls: [String]
    var studio: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                VideoModule(url: url)
                    .frame(height: 300)
                
                ScrollView {
                    VideoInfo(title: title, studio: studio, rate: rate, publication: publication, description: description, tags: tags)
                    Gallery(images: imgUrls)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct VideoModule: View {
    
    var url: String
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
    }
}

struct VideoInfo: View {
    
    var title: String
    var studio: String
    var rate: String
    var publication: String
    var description: String
    var tags: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                Text(studio)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text(rate)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text(publication)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text(description)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery: View {
    
    var images: [String]
    let gridForm = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                
                LazyHGrid(rows: gridForm, spacing: 8) {
                    ForEach(images, id: \.self) { image in
                        KFImage(URL(string: image)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "", title: "", rate: "", publication: "", description: "", tags: [""], imgUrls: [""], studio: "")
    }
}
