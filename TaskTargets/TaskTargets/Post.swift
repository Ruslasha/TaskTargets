//
//  Post.swift
//  TaskTargets
//
//  Created by Руслан Абрамов on 01.04.2024.
//

import Foundation

// Модель для поста
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

