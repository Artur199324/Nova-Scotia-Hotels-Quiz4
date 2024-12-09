//
//  NotificationsView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 10.12.2024.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.dismiss) var dismiss
 
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("Notifications")
                    Spacer()
                    
                }.padding(.top,80)
                
            
                Text("You don't have any notifications yet.")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.top,30)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    NotificationsView()
}
