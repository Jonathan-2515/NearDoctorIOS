//
//  Registrarse.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 6/1/24.
//

import SwiftUI
import FirebaseAuth

struct Registrarse: View {
    @State var txtUsuario:String = ""
    @State var txtPsswd:String = ""
    @State var txtPass2:String = ""
    //Para las alert
    @State private var showAlert:Bool = false
    @State private var mensajeAlert:String = ""
    @State private var tituloAlert:String = ""
    var body: some View {
        ZStack {
            // Fondo de la vista
            Image("fondo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
            VStack {
                // ImageView (Logo)
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    
                
                // TextView (Título)
                Text("Bienvenido a NearDoctor")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                // Email TextField
                TextField("Correo electrónico", text: $txtUsuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                    //.background(Color.blue)
                
                // Password TextField
                SecureField("Contraseña", text: $txtPsswd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                
                SecureField("Confirma tu Contraseña", text: $txtPass2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                // Ingresar Button
                
                
                Button(action: {
                    
                    if (txtPsswd == txtPass2)
                    {
                        RegisterEmail(pTxtUsuario: txtUsuario, pTxtPsswd: txtPsswd)
                    }
                    else
                    {
                        mensajeAlert = "Las Contraseñas No Coinciden"
                        showAlert = true
                    }
                    
                }) {
                    Text("REGISTRARME")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 160)
                        .background(Color.blue)
                        .cornerRadius(30)
                }//button
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(tituloAlert), message: Text(mensajeAlert), dismissButton: .default(Text("OK")))
                }
                
                Text("Regresar")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                //Spacer()
                
                .padding(.horizontal, 2)
                
            }//vStack
            .padding()
            .offset(y:40)
        }//scroll
    }//zstack
    }//view
    
    
    func RegisterEmail(pTxtUsuario:String, pTxtPsswd:String){
        Auth.auth().createUser(withEmail: pTxtUsuario, password: pTxtPsswd){
            (authResult, error) in
            if let error = error as NSError? {
              
                if let errorCode = AuthErrorCode.Code( rawValue: error.code){
                    switch errorCode {
                    case .emailAlreadyInUse:
                        mensajeAlert = "El correo Electrónico ya está en uso"
                    case .weakPassword:
                        mensajeAlert = "Constraseña demasiado débil"
                    case .invalidEmail:
                        mensajeAlert = "Email No Válido"
                    default:
                        mensajeAlert = error.localizedDescription
                    }
 
                }else{
                    mensajeAlert = error.localizedDescription
                }
 
 
                mensajeAlert = error.localizedDescription
                showAlert = true
            }else{
                mensajeAlert = "Usuario Registrado Correctamente"
                showAlert = true
            }
    }//func
}
    
    
    
    
    
    
    
}

struct Registrarse_Previews: PreviewProvider {
    static var previews: some View {
        Registrarse()
    }
}
