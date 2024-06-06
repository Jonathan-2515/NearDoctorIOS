//
//  RecoveryContra.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 6/1/24.
//

import SwiftUI
import FirebaseAuth

struct RecoveryContra: View {
    @State var txtUsuario:String = ""
    //@State var txtPsswd:String = ""
    //@State var txtPass2:String = ""
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
                Text("Recuperar Contraseña")
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
                /*
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
                
                */
                Text("Recibirá un correo electrónico con las indicaciones para realizar el cambio de su contraseña")
                    .font(.body)
                    .frame(width: 270, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    RecoveryPassInEmail(pTxtUsuario: txtUsuario)
                }) {
                    Text("RECUPERAR")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 160)
                        .background(Color.blue)
                        .cornerRadius(30)
                }//button
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(tituloAlert), message: Text(mensajeAlert), dismissButton: .default(Text("OK")))
                }
                /*
                Text("Regresar")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                */
                Spacer()
                //Spacer()
                
                .padding(.horizontal, 2)
                
            }//vStack
            .padding()
            .offset(y:40)
        }//scroll
    }//zstack
    }//view
    
    
    func RecoveryPassInEmail(pTxtUsuario:String){
        Auth.auth().sendPasswordReset(withEmail: pTxtUsuario){
            ( error) in
            if let error = error as NSError? {
              
                if let errorCode = AuthErrorCode.Code( rawValue: error.code){
                    switch errorCode {
                    case .userNotFound:
                        mensajeAlert = "El Email no se encontró en nuestros registros"
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
                mensajeAlert = "Se han enviado las indicaciones a su correo"
                showAlert = true
            }
    }//func
}
    
    
    
    
}

struct RecoveryContra_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryContra()
    }
}
