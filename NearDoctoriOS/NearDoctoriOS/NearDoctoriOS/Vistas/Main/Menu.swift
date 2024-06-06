//
//  Menu.swift
//  NearDoctoriOS
//
//  Created by MacOsX on 5/10/24.
//

import SwiftUI

struct Menu: View {
    
    @State private var isMenuOpen = false
    
    var body: some View {
        /*
        NavigationView {
            VStack {
                // Barra de herramientas
                ToolbarMenu()
               
                // Contenido principal
                Text("Contenido principal")
                    .font(.title)
                    .padding()
            }
            .navigationTitle("Bienvenidos")
           
            // Menú lateral (NavigationView)
            //NavigationView {
                List {
                    NavigationLink(destination: Text("Página 1")) {
                        Text("Opción 1")
                    }
                    NavigationLink(destination: Text("Página 2")) {
                        Text("Opción 2")
                    }
                    NavigationLink(destination: Text("Página 3")) {
                        Text("Opción 3")
                    }
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("Menú")
                .frame(width: 250)
           /* }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
 */
        }
 */
        
        //ZStack {
            // Fondo de la vista
            
        ZStack {
            Image("fondo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            // Contenido principal
            Color.white.edgesIgnoringSafeArea(.all)
           
            // Menú lateral
            MenuView(isMenuOpen: $isMenuOpen)
                .offset(x: isMenuOpen ? -75 : -UIScreen.main.bounds.width / 2 - 75)
                .animation(.default)
                .edgesIgnoringSafeArea(.all)
           
            // Botón para abrir el menú
            Button(action: {
                withAnimation {
                    isMenuOpen.toggle()
                }
            }) {
                Image(systemName: isMenuOpen ? "xmark" : "line.horizontal.3")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
            }
            .offset(x: isMenuOpen ? UIScreen.main.bounds.width / 2 - 130 : -130, y: -260)
            .animation(.default)
        }
        //}
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
/*

struct ToolbarMenu: View {
    var body: some View {
        HStack {
            Text("Título")
                .font(.headline)
                .foregroundColor(.white)
           
            Spacer()
        }
        .padding()
        .background(Color.blue)
    }
}
*/
struct MenuView: View {
    @Binding var isMenuOpen: Bool
   
    var body: some View {
        ZStack {
            // Fondo de la vista
            Image("fondodos")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Menú")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.leading, 20)
               
                ForEach(1..<4) { index in
                    Button(action: {
                        // Acción al seleccionar una opción del menú
                        print("Opción \(index) seleccionada")
                        withAnimation {
                            isMenuOpen = false
                        }
                    }) {
                        Text("Opción \(index)")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                    }
                }
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 2)
        .background(Color.blue.opacity(0.2))
    }
}

