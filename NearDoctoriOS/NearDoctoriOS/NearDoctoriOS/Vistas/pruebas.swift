//
//  pruebas.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/16/24.
//

import SwiftUI
import FirebaseAuth

struct pruebas: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                NavigationView {
                    VStack {
                        // Aquí van tus sub-vistas dentro del NavigationView
                        Text("Contenido del NavigationView")
                        Text("Probemos")
                    }
                    .navigationBarTitle("Título", displayMode: .inline)
                    
                }
                .frame(width: geometry.size.width / 1, height: geometry.size.height / 2)
                .background(Color.blue) // Solo para visualizar el área del NavigationView
               
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct pruebas_Previews: PreviewProvider {
    static var previews: some View {
        pruebas()
    }
}



