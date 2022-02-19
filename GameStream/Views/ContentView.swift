//
//  ContentView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 19/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Image("applogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 60)
                
                LoginAndRegistryView()
            }
        }
    }
}

struct LoginAndRegistryView: View {
    
    @State var showLogin: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    showLogin = true
                }.foregroundColor(showLogin ? .white : .gray)
                Spacer()
                Button("REGISTRATE") {
                    showLogin = false
                }.foregroundColor(showLogin ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if showLogin {
                LoginView()
            }else {
                RegistryView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1")
            .resizable()
        ContentView()
    }
}
