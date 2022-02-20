//
//  RegistryView.swift
//  GameStream
//
//  Created by Uriel Hernandez Gonzalez on 19/02/22.
//

import SwiftUI

struct RegistryView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confPassword: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button {
                    takePicture()
                } label: {
                    ZStack {
                        Image("img.profile.girl")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }

            }
            
            VStack(alignment: .leading) {
                Text("Correo electrónico*")
                    .foregroundColor(Color("DarkCyanColor"))
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                        .foregroundColor(.white)
                }
                
                Divider().frame(height: 1)
                    .background(Color("DarkCyanColor"))
                    .padding(.bottom)
                
                Text("Contraseña*")
                    .foregroundColor(.white)
                    .foregroundColor(Color("DarkCyanColor"))
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("*******")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                }
                
                Divider().frame(height: 1)
                    .background(Color("DarkCyanColor"))
                    .padding(.bottom)
                
                Text("Confirmar contraseña*")
                    .foregroundColor(.white)
                    .foregroundColor(Color("DarkCyanColor"))
                ZStack(alignment: .leading) {
                    if confPassword.isEmpty {
                        Text("*******")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $confPassword)
                        .foregroundColor(.white)
                }
                
                Divider().frame(height: 1)
                    .background(Color("DarkCyanColor"))
                    .padding(.bottom)
                
                RegistryButtonsModule()

            }.padding(.horizontal)
        }
    }
}

struct RegistryButtonsModule: View {
    var body: some View {
        Button {
            print("Registry")
        } label: {
            Text("REGISTRARSE")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("DarkCyanColor"), lineWidth: 1)
                        .shadow(color: .white, radius: 6)
                )
        }.padding(.bottom)
        Text("Registrate con redes sociales")
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

struct RegistryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("pantalla2")
            .resizable()
    }
}

func takePicture() {
    print("Foto")
}
