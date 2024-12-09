//
//  DetailsHotelsView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import SwiftUI

struct DetailsHotelsView: View {
    @Binding var hotelNumber: Int
    @EnvironmentObject var commentsManager: CommentsManager
    @Environment(\.dismiss) var dismiss
    @State private var nut = false
    @State private var name: String = ""
    @State private var message: String = ""
    @State private var set = false
    private let segments = ["Description","Comments"]
    @State private var selectedSegment = 0
    var body: some View {
        GeometryReader { geometry in
            VStack{
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
                    
                    Image("bh\(hotelNumber)")
                        .padding(.top,40)
                    
                    HStack(spacing: 0) {
                        ForEach(Array(segments.enumerated()), id: \.offset) { index, segment in
                            Text(segment)
                                .font(.system(size: 16))  // Уменьшенный размер шрифта
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)  // Уменьшаем вертикальные отступы для уменьшения высоты
                                .padding(.horizontal, 1)  // Немного уменьшим горизонтальные отступы
                                .background(selectedSegment == index ? Color("col1") : Color.clear)  // Цвет фона для выбранного элемента
                                .foregroundColor(selectedSegment == index ? Color.white : Color.white )  // Цвет текста для выбранного элемента
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedSegment = index  // Обновляем выбранный сегмент
                                }
                        }
                    }
                    .padding(.vertical, 5)  // Уменьшение общей высоты переключателя
                    .background(Color("col2"))  // Фон для всего переключателя
                    .cornerRadius(20)  // Скругление углов
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple.opacity(0.5), lineWidth: 2)  // Рамка вокруг переключателя
                    )
                    .padding(.horizontal, 16)
                    .padding(.top,20)
                    
                    if selectedSegment == 0 {
                        ScrollView{
                            Image("q\(hotelNumber)")
                        }.padding(.top,10)
                    }else{
                        ScrollView{
                            ScrollView {
                                ForEach(commentsManager.getComments(for: "hote\(hotelNumber)")) { comment in
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(comment.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(comment.message)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(Color("col2"))
                                    .cornerRadius(12)
                                    .shadow(radius: 1)
                                    .padding(.horizontal, 16) // Отступы от краев экрана
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                            }
                            // Поля для ввода имени и комментария
                            VStack(spacing: 16) {
                                Text("Write comment")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                
                                
                                // Поле для ввода имени
                                
                                TextField("", text: $name)
                                    .padding()
                                    .background(Color("col2"))
                                    .cornerRadius(12)
                                    .shadow(radius: 1)
                                    .foregroundColor(.white) // Цвет текста
                                    .font(.system(size: 18, weight: .bold))
                                    .overlay {
                                        if name.isEmpty {
                                            HStack{
                                                Text("Your Name").foregroundColor(.white).padding(.leading,10)
                                                Spacer()
                                            }
                                        }
                                    }
                                
                                // Поле для сообщения
                                TextField("", text: $message)
                                    .padding()
                                    .background(Color("col2"))
                                    .cornerRadius(12)
                                    .shadow(radius: 1)
                                    .foregroundColor(.white) // Цвет текста
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(height: 70) // Высота поля
                                    .overlay {
                                        if message.isEmpty {
                                            HStack{
                                                Text("Your Message").foregroundColor(.white).padding(.leading,10)
                                                Spacer()
                                            }
                                        }
                                    }
                                
                                
                                // Кнопка для отправки комментария
                                Button(action: {
                                    addComment()
                                }) {
                                    Image("Frame 3")
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("bacc"))
                    .ignoresSafeArea()
            }
        } .fullScreenCover(isPresented: $nut) {
            NotificationsView()
        }
        .fullScreenCover(isPresented: $set) {
            SettingsView()
        }
    }
    
    private func addComment() {
        guard !name.isEmpty, !message.isEmpty else { return } // Проверка на заполненность полей
        commentsManager.addComment(for: "hote\(hotelNumber)", name: name, message: message) // Добавление комментария в менеджер
        name = ""   // Сброс поля имени
        message = "" // Сброс поля сообщения
    }
}

#Preview {
    DetailsHotelsView(hotelNumber:.constant(1) ).environmentObject(CommentsManager())
}
