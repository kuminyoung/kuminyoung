//
//  ColorConstants.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import SwiftUI

struct ColorConstants{
    static let primary = Color.init(red: 47/255, green: 16/255, blue: 118/255)
    static let secondary = Color.init(red: 142/255, green: 119/255, blue: 204/255)
    static let imageTint = Color.init(red: 182/255, green: 152/255, blue: 255/255)
    static let border = Color.init(red: 66/255, green: 38/255, blue: 255/255)
    
    static let cardBottomLeft = Color.init(red: 107/255, green: 27/255, blue: 255/255)
    static let cardTopRight = Color.init(red: 134/255, green: 64/255, blue: 255/255)
    
    static let cardBackground = LinearGradient(
        gradient: Gradient(colors: [cardTopRight, cardBottomLeft]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    






}

