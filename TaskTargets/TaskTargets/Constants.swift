//
//  Constants.swift
//  TaskTargets
//
//  Created by Руслан Абрамов on 01.04.2024.
//

import Foundation

/// Константы
final class Constants {
    /// Режим работы на моках вместо сервера
    static var isMockMode: Bool {
    #if Mock
        true
    #else
        false
    #endif
    }
}
