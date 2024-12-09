//
//  SettingsView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 11.12.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
 
    @State var terms = false
    @State var pilis = false
    @State var cont = false
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    Button {
                        self.dismiss()
                    } label: {
                        Image("🦆 icon _arrow left fill_")
                    }.padding(.leading,20)
                    Image("left3")
                    Spacer()
                    
                }.padding(.top,80)
                
                Button {
                    requestAppReview()
                } label: {
                    Image("set1")
                }
                
                Button {
                    cont.toggle()
                } label: {
                    Image("set2")
                }
                
                Button {
                    terms.toggle()
                } label: {
                    Image("set3")
                }
                Button {
                    pilis.toggle()
                } label: {
                    Image("set4")
                }

            
               
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("bacc"))
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $terms) {
                    TermsofUseView()
                }
                .fullScreenCover(isPresented: $pilis) {
                    PrivacyPolicyView()
                }
                .fullScreenCover(isPresented: $cont) {
                    ContentView()
                }
        }
    }
    
    func requestAppReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
}

#Preview {
    SettingsView()
}
