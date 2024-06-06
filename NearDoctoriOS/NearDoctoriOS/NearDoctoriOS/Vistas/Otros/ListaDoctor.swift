//
//  ListaDoctor.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/10/24.
//

import SwiftUI

struct ListaDoctor: View {
    @State private var doctors = [
        Doctor(name: "Dr. John Doe", specialty: "Cardiology"),
        Doctor(name: "Dr. Jane Smith", specialty: "Neurology"),
        Doctor(name: "Dr. Emily Johnson", specialty: "Pediatrics"),
        Doctor(name: "Dr. Michael Brown", specialty: "Orthopedics"),
        Doctor(name: "Dr. Linda Davis", specialty: "Dermatology")
    ]
   
    @State private var name: String = ""
    @State private var specialty: String = ""
    
    
    var body: some View {
        
        
        //NavigationView {
            
            ZStack {
                // Fondo de la vista
                Image("fondodos")
                    .resizable()
                    //.scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    //.aspectRatio(contentMode: .fill)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Doctores")
                        .font(.title)
                        .bold()
                        .padding(.top, 5)
                        .padding(.horizontal, 16)
                     
                    Divider()
                        .background(Color.blue)
                        .padding(.horizontal, 16)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Nombre:")
                            .padding(.horizontal, 16)
                       
                        TextField("Nombre", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 16)
                       /*
                        Text("Especialidad:")
                            .padding(.horizontal, 16)
                       
                        TextField("Especialidad", text: $specialty)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 16)
                        */
                    }//vstack
                   
                    Button(action: {
                        // Acción de búsqueda
                    }) {
                        Text("Buscar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                    }
                   
                    List(doctors) { doctor in
                        VStack(alignment: .leading) {
                            Text(doctor.name)
                                .font(.headline)
                            Text(doctor.specialty)
                                .font(.subheadline)
                        }
                    }//list
                    .listStyle(PlainListStyle())
                    .padding(.top, 5)
                }//vstack
                //.navigationTitle("Doctores")
            }//zstack
            
        //}//navigation
        //.offset(y: -0)
    }
}

struct ListaDoctor_Previews: PreviewProvider {
    static var previews: some View {
        ListaDoctor()
    }
}
struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
}
