//
//  Item.swift
//  BitLab
//
//  Created by 李皓钧 on 19/4/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
