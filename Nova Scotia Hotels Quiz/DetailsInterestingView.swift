//
//  DetailsInterestingView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 10.12.2024.
//

import SwiftUI

struct DetailsInterestingView: View {
    @Binding var hotelNumber: Int
    @State private var nut = false
    @State private var set = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        GeometryReader { geometru in
            VStack{
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("Details")
                    Spacer()
                    Button {
                        set.toggle()
                    } label: {
                        Image("tabler-icon-settings")
                    }.padding(.trailing,10)
                    
                    Button {
                        nut.toggle()
                    } label: {
                        Image("tabler-icon-bell")
                    }.padding(.trailing,20)
                }.padding(.top,80)
                ScrollView{
                    Image("ri\(hotelNumber)")
                    Image("y\(hotelNumber)").padding()
                }.padding(.top,30)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
            
        } .fullScreenCover(isPresented: $nut) {
            NotificationsView()
        }
        .fullScreenCover(isPresented: $set) {
            SettingsView()
        }
    }
}

#Preview {
    DetailsInterestingView(hotelNumber:.constant(1))
}
