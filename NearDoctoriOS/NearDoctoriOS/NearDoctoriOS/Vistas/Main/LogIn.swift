//
//  LogIn.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/10/24.
//

import SwiftUI
//import FirebaseAuth
import Firebase

struct LogIn: View {
    @State var txtUsuario:String = ""
    @State var txtPsswd:String = ""
    //Para las alert
    @State private var showAlert:Bool = false
    @State private var mensajeAlert:String = ""
    @State private var tituloAlert:String = ""
    //pantallas
    @State var btnRegistra:Bool = false
    @State var btnPasswd:Bool = false
    @State var iraHome:Bool = false
    
    var body: some View {
        NavigationView{
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
                Text("BIENVENIDOS")
                    .font(.title)
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
                
                NavigationLink(destination: HomeView(), isActive: $iraHome){
                    EmptyView()
                }
                
                    // Ingresar Button
                Button(action: {
                    LogInEmail(pTxtUsuario: txtUsuario, pTxtPsswd: txtPsswd)
                }) {
                    Text("INGRESAR")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 160)
                        .background(Color.blue)
                        .cornerRadius(30)
                }//button
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(tituloAlert), message: Text(mensajeAlert), dismissButton: .default(Text("OK")))
                }
                //.background(
                
                //)
                Spacer()
                /*
                Text("Entrar sin cuenta")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                //Spacer()
                */
                // Texto adicional (Olvidaste contraseña, Crear cuenta, etc.)
                HStack {
                    Text("¿Olvidaste tu contraseña?")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            btnPasswd=true
                        })
                        .sheet(isPresented: $btnPasswd, onDismiss: {btnPasswd=false},content: {
                            VStack{
                                RecoveryContra()
                            }
                        })

                    Spacer()
                    
                    
                    Text("Crear cuenta")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            btnRegistra=true
                        })
                        .sheet(isPresented: $btnRegistra, onDismiss: {btnRegistra=false},content: {
                            VStack{
                                Registrarse()
                            }
                        })
                }//Hstack
                .padding(.horizontal, 2)
                
            }//vStack
            .padding()
            .offset(y:-40)

        }//scroll
    }//zstack
        }
        
/*
        
        .alert( isPresented: $showAlert){
            Alert(
                title: Text(tituloAlert),
                message: Text(mensajeAlert),
                dismissButton: .default(Text("Aceptar"))
         )
    }//.alert
*/
    }//view
    
    func LogInEmail(pTxtUsuario:String, pTxtPsswd:String){
        
        //print ("el correo es \(txtUsuario) y la PSSWD es \(txtPsswd)")
        
        Auth.auth().signIn(withEmail: pTxtUsuario, password: pTxtPsswd){
            (authResult, error) in
            if let error = error as NSError? {
              
                if let errorCode = AuthErrorCode.Code( rawValue: error.code){
                    switch errorCode {
                    case .userNotFound:
                        mensajeAlert = "Usuario No Registrado"
                    case .wrongPassword:
                        mensajeAlert = "Constraseña Incorrecta"
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
                //mensajeAlert = "LogIn Correcto"
                //showAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                {
                    self.iraHome = true
                }
                
            }
    }//func
}
    
}


struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        //LogIn(txtUsuario: "jstmaria12@gmail.com", txtPsswd: "contra1234")
        LogIn()
    }
}

