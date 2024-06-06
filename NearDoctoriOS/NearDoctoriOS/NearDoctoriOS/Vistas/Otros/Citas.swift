//
//  Citas.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/10/24.
//

import SwiftUI

struct Citas: View {
    var body: some View {
        NavigationView {
            DrawerNavigationView()
                .navigationTitle("Bienvenidos")
        }
    }
}

struct Citas_Previews: PreviewProvider {
    static var previews: some View {
        Citas()
    }
}
struct DrawerNavigationView: View {
    @State private var isShowingAppointmentScreen = true

    var body: some View {
        VStack {
            // Toolbar
            Toolbar(isShowingAppointmentScreen: $isShowingAppointmentScreen)
                .frame(height: 50)
                .background(Color.blue) // Cambia el color de fondo según tus necesidades
           
            // Contenido principal
            Text("Contenido principal")
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
           
        }
        .sheet(isPresented: $isShowingAppointmentScreen) {
            AppointmentView(isShowingAppointmentScreen: $isShowingAppointmentScreen)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Aplicar estilo de navegación
    }
}

struct Toolbar: View {
    @Binding var isShowingAppointmentScreen: Bool
   
    var body: some View {
    
        HStack {
            Text("Título")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
           
            //Spacer()
           
            Button(action: {
                isShowingAppointmentScreen = true
            }) {
                Text("Agendar Cita")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .background(Color.blue) // Cambia el color de fondo según tus necesidades
    }
}

struct AppointmentView: View {
    @Binding var isShowingAppointmentScreen: Bool
   
    var body: some View {
        VStack {
            Text("Agendar Cita")
                .font(.title)
                .padding()
           
            Button("Cerrar") {
                isShowingAppointmentScreen = false
            }
            .padding()
        }
    }
}
