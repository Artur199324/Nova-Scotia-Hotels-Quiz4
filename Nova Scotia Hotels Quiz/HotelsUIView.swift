//
//  HotelsUIView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct HotelsUIView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedHotelNumber = 0
    @State private var hotel = false
    @State private var nut = false
    @State private var set = false
    var body: some View {
        GeometryReader { geometry in
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image("🦆 icon _arrow left fill_")
                }.padding(.leading,20)
                Image("left")
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
                    
                    hotel.toggle()
                } label: {
                    Image("hot1")
                }.padding(.trailing,20)
                Button {
                    
                    selectedHotelNumber = 2
                    hotel.toggle()
                } label: {
                    Image("hot2")
                }.padding(.trailing,20)
             
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 3
                } label: {
                    Image("hot4")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 4
                } label: {
                    Image("hot5")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 5
                } label: {
                    Image("hot6")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 6
                } label: {
                    Image("hot7")
                }.padding(.trailing,20)
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 7
                } label: {
                    Image("hot8")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 8
                } label: {
                    Image("hot9")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 9
                } label: {
                    Image("hot10")
                }.padding(.trailing,20)
                
                Button {
                    hotel.toggle()
                    selectedHotelNumber = 10
                } label: {
                    Image("hot11")
                }.padding(.trailing,20)
            }.padding(.top,30)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bacc"))
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $hotel) {
                DetailsHotelsView(hotelNumber: $selectedHotelNumber).environmentObject(CommentsManager())
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
    HotelsUIView()
}
