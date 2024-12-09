//
//  StartQuizView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 10.12.2024.
//

import SwiftUI

struct StartQuizView: View {
    @Environment(\.dismiss) var dismiss
    @State private var q1 = false
    @State private var q2 = false
    @State private var q3 = false
    @State private var q4 = false
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("Quiz")
                    Spacer()
                
                }.padding(.top,80)
                
                ScrollView{
                    Button {
                        q1.toggle()
                    } label: {
                    
                        Image("q1 1")
                    }
                    
                    Button {
                        q2.toggle()
                    } label: {
                    
                        Image("q2 1")
                    }
                    
                    Button {
                        q3.toggle()
                    } label: {
                    
                        Image("q3 1")
                    }
                    
                    Button {
                        q4.toggle()
                    } label: {
                    
                        Image("q4 1")
                    }

                }.padding(.top,20)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $q1) {
                    QuizView1()
                }
                .fullScreenCover(isPresented: $q2) {
                    QuizView2()
                }
                .fullScreenCover(isPresented: $q3) {
                    QuizView3()
                }
                .fullScreenCover(isPresented: $q4) {
                    QuizView4()
                }
        }
    }
}

#Preview {
    StartQuizView()
}
