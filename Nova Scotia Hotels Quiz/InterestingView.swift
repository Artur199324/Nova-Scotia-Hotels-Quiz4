//
//  InterestingView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 10.12.2024.
//

import SwiftUI

struct InterestingView: View {
    @Environment(\.dismiss) var dismiss
    @State var detail = false
    @State private var nut = false
    @State private var set = false
    @State private var selectedHotelNumber = 0
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("left2")
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
                    
                    Button {
                        selectedHotelNumber = 1
                        detail.toggle()
                    } label: {
                        Image("in1")
                    }
                    
                    Button {
                        selectedHotelNumber = 2
                        detail.toggle()
                    } label: {
                        Image("in2")
                    }
                    
                    Button {
                        selectedHotelNumber = 3
                        detail.toggle()
                    } label: {
                        Image("in3")
                    }
                    
                    Button {
                        selectedHotelNumber = 4
                        detail.toggle()
                    } label: {
                        Image("in4")
                    }
                    
                    Button {
                        selectedHotelNumber = 5
                        detail.toggle()
                    } label: {
                        Image("in5")
                    }
                    Button {
                        selectedHotelNumber = 6
                        detail.toggle()
                    } label: {
                        Image("in6")
                    }
                    
                    Button {
                        selectedHotelNumber = 7
                        detail.toggle()
                    } label: {
                        Image("in7")
                    }

                }.padding(.top,30)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $detail) {
                    DetailsInterestingView(hotelNumber: $selectedHotelNumber)
                }
                .fullScreenCover(isPresented: $nut) {
                    NotificationsView()
                }
                .fullScreenCover(isPresented: $set) {
                    SettingsView()
                }
        }
    }
}

#Preview {
    InterestingView()
}
