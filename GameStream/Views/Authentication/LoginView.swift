//
//  LoginView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 19/02/22.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCyanColor"))
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 1)
                    .background(Color("DarkCyanColor"))
                    .padding(.bottom)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                }
                
                Divider().frame(height: 1)
                    .background(Color("DarkCyanColor"))
                    .padding(.bottom)
            }.padding(.horizontal, 77)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
