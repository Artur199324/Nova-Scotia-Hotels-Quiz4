//
//  ContactUsView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 11.12.2024.
//

import SwiftUI

struct ContactUsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
       @State private var email: String = ""
       @State private var message: String = ""
  
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("left5")
                    Spacer()
                    
                }.padding(.top,80)
                
                
                    VStack(alignment: .leading, spacing: 5) {
                                Group {
                                    // Поле для ввода имени
                                    Text("Your Name")
                                        .font(.headline)
                                        .foregroundColor(Color("Color3"))
                                        .padding(.top,30)
                                    
                                    TextField("Enter Your Name", text: $name)
                                        .padding()
                                        .background(Color("Color3"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                    
                                    // Поле для ввода email
                                    Text("Email")
                                        .font(.headline)
                                        .foregroundColor(Color("Color3"))
                                    
                                    TextField("Enter Your Email", text: $email)
                                        .padding()
                                        .background(Color("Color3"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                        .keyboardType(.emailAddress)
                                    
                                    // Поле для ввода сообщения
                                    Text("Message")
                                        .font(.headline)
                                        .foregroundColor(Color("Color3"))
                                    
                                    TextEditor(text: $message)
                                        .padding()
                                        .background(Color("Color3"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                        .frame(height: 150)
                                        .scrollContentBackground(.hidden) // Убирает стандартный фон
                                        .background(Color.purple.opacity(0.3))
                                }
                                
                     
                            
                    }.padding(.horizontal,50)
                        .padding(.vertical,0)
                
                Button {
                    self.dismiss()
                } label: {
                    Image("Frame 4")
                }.padding(.top,30)

                Image("We will respond to your appeal at the earliest opportunity. Have a nice day!")
                    .padding(.top,80)
                
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
              
        }
    }
}

#Preview {
    ContactUsView()
}
