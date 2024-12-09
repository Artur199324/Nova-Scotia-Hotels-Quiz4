//
//  Comment.swift
//  Nova Scotia Hotels Quiz
//
//  Created by Artur on 09.12.2024.
//

import Foundation
struct Comment: Identifiable, Codable {
    let id: UUID
    let name: String
    let message: String
}
