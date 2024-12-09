//
//  MenuView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct MenuView: View {
    @State private var hotel = false
    @State private var pup1 = false
    @State private var intresting = false
    @State private var qw = false
    @State private var nut = false
    @State private var set = false
   
    @State private var selectedHotelNumber = 0
    var body: some View {
        GeometryReader { geometry in
            
            VStack{
                ScrollView{
                    HStack{
                        Image("Welcome!").padding(.leading ,20)
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
                        
                    }
                    HStack{
                        Image("Popular")
                            .padding(.leading,20)
                        Spacer()
                        Button {
                            hotel.toggle()
                        } label: {
                            Image("Frame 5")
                        }.padding(.trailing,20)
                        
                    }.padding(.top,40)
                    HStack{
                        Button {
                            selectedHotelNumber = 1
                            pup1.toggle()
                        } label: {
                            Image("Frame 8")
                        }
                        Button {
                            selectedHotelNumber = 2
                            pup1.toggle()
                        } label: {
                            Image("Frame 9")
                        }
                    }.padding(.top,30)
                    Button {
                        hotel.toggle()
                    } label: {
                        Image("Group 3")
                    }.padding(.top,20)
                    HStack{
                        Button {
                            qw.toggle()
                        } label: {
                            Image("Group 4")
                        }
                        Button {
                            intresting.toggle()
                        } label: {
                            Image("Group 5")
                        }
                    }.padding(.top,30)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("home").resizable().scaledToFill())
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $nut) {
                    NotificationsView()
                }
                .fullScreenCover(isPresented: $set) {
                    SettingsView()
                }
                .fullScreenCover(isPresented: $hotel) {
                    HotelsUIView()
                }
                .fullScreenCover(isPresented: $qw) {
                    StartQuizView()
                }
                .fullScreenCover(isPresented: $intresting) {
                    InterestingView()
                }
                .fullScreenCover(isPresented: $pup1) {
                    DetailsHotelsView(hotelNumber: $selectedHotelNumber).environmentObject(CommentsManager())
                }
        }
    }
}

#Preview {
    MenuView()
}
