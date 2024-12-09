//
//  ContentView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isAcaunt = false
    @State private var isUserLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                isAcaunt.toggle()
                print(isUserLoggedIn)
            }) {
                Image("Frame 1")
            }.padding(.bottom,50)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("onboarding").resizable().scaledToFill())
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $isAcaunt) {
              
                if !isUserLoggedIn {
            
                             CreateView()
                         } else {
                             MenuView()
                           
                         }
            }
       
    }
}

#Preview {
    ContentView()
}
