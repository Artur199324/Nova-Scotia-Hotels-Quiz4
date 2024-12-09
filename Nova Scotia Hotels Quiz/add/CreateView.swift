//
//  CreateView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct CreateView: View {
    @State private var username: String = ""
     @State private var password: String = ""
     @State private var showAlert: Bool = false
     @State private var crata: Bool = false
     @State private var gost: Bool = false
    var body: some View {

        VStack(spacing: 20){
            TextField("", text: $username)
                           .padding()
                           .background(Image("Frame 44"))
                           .cornerRadius(10)
                           .foregroundColor(.white)
                           .overlay {
                               if username.isEmpty {
                                   HStack{
                                       Text("Username").foregroundColor(.white).padding(.leading,20)
                                       Spacer()
                                   }}
                           }
                           .padding(.horizontal, 40)
                           .padding(.top,200)
                         

                       SecureField("", text: $password)
                           .padding()
                           .background(Image("Frame 44"))
                           .cornerRadius(10)
                           .foregroundColor(.white)
                           .overlay {
                               if password.isEmpty {
                                   HStack{
                                       Text("Password").foregroundColor(.white).padding(.leading,20)
                                       Spacer()
                                   }}
                           }
                           .padding(.horizontal, 40)

                       Button(action: {
                           if username.isEmpty || password.isEmpty {
                               showAlert = true
                           } else {
                               crata.toggle()
                           }
                       }) {
                           Image("Frame 111")
                       }
                       .padding(.horizontal, 40)
                       .alert(isPresented: $showAlert) {
                           Alert(
                               title: Text("Error"),
                               message: Text("Please fill in all fields."),
                               dismissButton: .default(Text("OK"))
                           )
                       }
            Spacer()
            Button(action: {
                gost.toggle()
                      }) {
                          Image("Frame 45")
                      }
                      .padding(.horizontal, 40)
                      
                      Spacer().frame(height: 20)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("account 2").resizable().scaledToFill())
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $crata) {
                CreateAccountView()
            }
            .fullScreenCover(isPresented: $gost) {
                MenuView()
            }
           
       
    }
    
}

#Preview {
    CreateView()
}
