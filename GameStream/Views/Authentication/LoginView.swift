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
                
                Text("Escribe tu contraseña")
                    .foregroundColor(.white)
                    .foregroundColor(Color("DarkCyanColor"))
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
                
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("DarkCyanColor"))
                    .padding(.bottom)
                
                LoginButtonsModule()
            }.padding(.horizontal)
        }
    }
}

struct LoginButtonsModule: View {
    var body: some View {
        Button {
            login()
        } label: {
            Text("INICIAR SESIÓN")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("DarkCyanColor"), lineWidth: 1)
                        .shadow(color: .white, radius: 6)
                )
        }
        Spacer(minLength: 100)
        Text("Inicia sesión con redes sociales")
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
        
        HStack {
            Button {
                print("Facebook login")
            } label: {
                Text("Facebook")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .background(Color("FacebookLoginColor"))
                    .cornerRadius(10)

            }
            Button {
                print("Twitter login")
            } label: {
                Text("Twitter")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .background(Color("FacebookLoginColor"))
                    .cornerRadius(10)
            }

        }.frame(maxWidth: .infinity, alignment: .center)

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


func login() {
    print("Login")
}
