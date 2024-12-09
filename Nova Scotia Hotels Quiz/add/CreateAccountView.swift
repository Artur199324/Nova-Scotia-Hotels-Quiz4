//
//  CreateAccountView.swift
//  Nova Scotia Hotels & Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct CreateAccountView: View {
    @State var mal = false
    @State var mal2 = true
    @State var ho1 = false
    @State var ho2 = false
    @State var ho3 = false
    @State var mall = false
    @State var welcomeUsernameView = false
  
    var body: some View {
    
            VStack{
                ScrollView{
                    HStack{
                        Button {
                            if mal {
                                mal.toggle()
                                mal2.toggle()
                                mall.toggle()
                            }
                            
                        } label: {
                            Image(mal ? "image11" : "image1")
                            
                        }
                        
                        Button {
                            if mal2{
                                mal.toggle()
                                mal2.toggle()
                                mall.toggle()
                                
                            }
                        } label: {
                            Image(mal2 ? "image2" : "image22")
                            
                        }
                        
                    }
                    
                    Image("header")
                    
                    Button {
                        ho1.toggle()
                    } label: {
                        Image("ho1").overlay {
                            HStack{
                                Spacer()
                                Image(ho1 ? "checkmark-circle-03" : "checkmark-circle-02").padding(.trailing, 30)
                            }
                        }
                    }
                    Button {
                        ho2.toggle()
                    } label: {
                        Image("ho2")
                            .overlay {
                                HStack{
                                    Spacer()
                                    Image(ho2 ? "checkmark-circle-03" : "checkmark-circle-02").padding(.trailing, 30)
                                }
                            }
                    }
                    Button {
                        ho3.toggle()
                    } label: {
                        Image("ho3")
                            .overlay {
                                HStack{
                                    Spacer()
                                    Image(ho3 ? "checkmark-circle-03" : "checkmark-circle-02").padding(.trailing, 30)
                                }
                            }
                    }
                    
                    Button {
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        welcomeUsernameView.toggle()
                    } label: {
                        Image("Frame 2")
                    }.padding(.top,30)
                    
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("account 1").resizable().scaledToFill())
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $welcomeUsernameView) {
                    WelcomeUsernameView(isUserLoggedIn: $mall)
                }
        }
    
}

#Preview {
    CreateAccountView()
}
