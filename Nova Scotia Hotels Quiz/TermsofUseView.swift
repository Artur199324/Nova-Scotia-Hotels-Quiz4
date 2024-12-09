//
//  TermsofUseView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 11.12.2024.
//

import SwiftUI

struct TermsofUseView: View {
    @Environment(\.dismiss) var dismiss

       var body: some View {
           NavigationView {
               WebView(url: URL(string: "https://sites.google.com/view/nova-scotia-hotels-quiz-privac/")!)
                   .navigationTitle("Terms of Use")
                   .navigationBarTitleDisplayMode(.inline)
                   .navigationBarItems(trailing: Button(action: {
                       dismiss() // Закрытие представления при нажатии кнопки "Close"
                   }) {
                       Text("Close")
                           .foregroundColor(.blue)
                   })
           }
       }
}

#Preview {
    TermsofUseView()
}
