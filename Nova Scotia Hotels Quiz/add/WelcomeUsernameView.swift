//
//  WelcomeUsernameView.swift
//  Nova Scotia Hotels & Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct WelcomeUsernameView: View {
    @Binding var isUserLoggedIn: Bool
    @State private var navigateToMenuView = false
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                Image(isUserLoggedIn ? "image1":"image22")
                Image("Tap to continue...")
                Spacer().frame(height: 200)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("account 3").resizable().scaledToFill())
            .ignoresSafeArea()
            .onAppear {
                          // Запускаем переход через 2 секунды
                          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                              navigateToMenuView = true
                          }
                      }
                      .fullScreenCover(isPresented: $navigateToMenuView) {
                          MenuView() // Замените на ваше следующее представление
                      }
        }
    }
}

#Preview {
    WelcomeUsernameView(isUserLoggedIn:  .constant(true))
}
