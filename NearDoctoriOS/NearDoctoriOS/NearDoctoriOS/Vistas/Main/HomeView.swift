//
//  HomeView.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/14/24.
//

import SwiftUI

struct HomeView: View {
    @State private var categories = [
        Doctor(name: "Internistas", specialty: "70 Drs"),
        Doctor(name: "Cardiologos", specialty: "25 Drs"),
        Doctor(name: "Radiologos", specialty: "5 Drs"),
        Doctor(name: "Nutricionista", specialty: "8 Drs"),
        Doctor(name: "Dermatologo", specialty: "10 Drs")
    ]
    var body: some View {

        //NavigationView {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Categorías")
                .font(.title)
                .bold()
                .padding(.top, 25)
                .padding(.horizontal, 16)
           /*
            Divider()
                .background(Color.blue)
                .padding(.horizontal, 16)
           
            VStack(alignment: .leading, spacing: 8) {
                Text("Nombre:")
                    .padding(.horizontal, 16)
               
                Text("Especialidad:")
                    .padding(.horizontal, 16)
            }
           
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
           */
            List(categories) { categ in
                VStack(alignment: .leading) {
                    NavigationLink("\(categ.name)".capitalized, destination: ListaDoctor())
                        .font(.headline)
                    Text(categ.specialty)
                        .font(.subheadline)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top, 8)
            //.navigationTitle("Categorías")
        }
        //}
        //.offset(y: -80)
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

