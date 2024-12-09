//
//  QuizView3.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 10.12.2024.
//

import SwiftUI

struct QuizView3: View {
    @Environment(\.dismiss) var dismiss
    @State private var questions = Questions()
    @State private var numberQwer = 0
    @State private var time = 45
    @State private var count = 0
    @State private var wrong = 0
    @State private var one = false
    @State private var two = false
    @State private var thre = false
    
    @State private var one2 = false
    @State private var two2 = false
    @State private var thre2 = false
    
    @State private var one3 = false
    @State private var two3 = false
    @State private var thre3 = false
    
    @State private var one4 = false
    @State private var two4 = false
    @State private var thre4 = false
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
                    
                }.padding(.top,40)
                
                ScrollView{
                    if  numberQwer == questions.questtion3.count-1 {
                        // Сообщение, если время закончилось или вопросы завершены
                        Text("You passed the quiz. Below are your results")
                            .foregroundColor(.white)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(30)
                           
                            .cornerRadius(20)
                            .padding(.top, 40)
                            .padding(.horizontal)
                        Spacer()
                        
                        HStack{
                            Text("Correct Anwsers").foregroundColor(.white).padding(.leading ,50)
                            Spacer()
                            Text("\(wrong)").foregroundColor(.white).padding(.trailing ,50)
                        }.padding()
                            .background(Image("Group 7"))
                        
                        
                    } else {
                        // Вопрос
                        Image("\(questions.img3[numberQwer])")
                            .padding(.top, 10)
                        Text("\(questions.questtion3[numberQwer])")
                            .foregroundColor(.white)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding(30)
                            
                            .cornerRadius(20)
                            .padding(.top, 5)
                            .padding(.horizontal)
                        
                        VStack {
                            buttonWithDelay(index: 0, one: $one, two: $two, three: $thre)
                            buttonWithDelay(index: 1, one: $one2, two: $two2, three: $thre2)
                        }
                        
                        VStack {
                            buttonWithDelay(index: 2, one: $one3, two: $two3, three: $thre3)
                            buttonWithDelay(index: 3, one: $one4, two: $two4, three: $thre4)
                        }
                    }
                }
                
            }.padding(.top,20)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bacc"))
            .ignoresSafeArea()
    
    }
    func getBackgroundColor(index: Int, one: Binding<Bool>, two: Binding<Bool>, three: Binding<Bool>) -> Color {
        if one.wrappedValue {
            return Color("Color4")
        } else if two.wrappedValue {
            return Color("Color6")
        } else if three.wrappedValue {
            return Color("Color5")
        } else {
            return Color("Color3")
        }
    }
    
    func buttonWithDelay(index: Int, one: Binding<Bool>, two: Binding<Bool>, three: Binding<Bool>) -> some View {
        Button(action: {
            one.wrappedValue.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if questions.wrong3[numberQwer] == index + 1 {
                    two.wrappedValue.toggle()
                    one.wrappedValue.toggle()
                    wrong += 1
                } else {
                    three.wrappedValue.toggle()
                    one.wrappedValue.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if questions.wrong3[numberQwer] == index + 1 {
                        two.wrappedValue.toggle()
                    } else {
                        three.wrappedValue.toggle()
                    }
                    if numberQwer < questions.wrong3.count - 1 {
                        numberQwer += 1
                    }
                }
            }
        }, label: {
            Text("\(questions.answer3[numberQwer][index])")
                .foregroundColor(.white)
                .font(.title3)
                .multilineTextAlignment(.leading) // Многострочное выравнивание по левому краю
                .frame(maxWidth: .infinity, alignment: .leading) // Выравнивание всего текста по левому краю
                .padding(20)
        })
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(getBackgroundColor(index: index, one: one, two: two, three: three))
        .cornerRadius(20)
    }
}


#Preview {
    QuizView3()
}
