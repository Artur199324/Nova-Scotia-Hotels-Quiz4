//
//  WebView.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 11.12.2024.
//

import Foundation
import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
